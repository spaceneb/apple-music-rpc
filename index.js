const exec = require("child_process").exec;
const RPC = require('discord-rpc');
const clientId = '848701710553710604';
const client = new RPC.Client({ transport: 'ipc' });
const cron = require('node-cron');

function setTime(sec) {
    var t = new Date();
    t.setSeconds(t.getSeconds() - sec);
    return t.getTime()
}

function refreshRPC() {
    var activity = {};
    exec('./data.sh', (err, stdout, stderr) => {
        var data = JSON.parse(stdout)
        activity.details = data.name;
        activity.state = `${data.artist} - ${data.album}`;
        activity.largeImageKey = 'icon';
        activity.largeImageText = 'Apple Music';
        if (data.state === 'playing') {
            activity.startTimestamp = setTime(data.position)
        }
        if (data.duration !== '0') {
            activity.buttons = [{label:"Search on Apple Music",url:`https://music.apple.com/us/search?term=${encodeURIComponent(data.name)}`},{label:"Search on Spotify",url:`https://open.spotify.com/search/${encodeURIComponent(data.name)}`}]
        }
        try {
            client.setActivity(activity);
        } catch(e) {
            console.error(e)
        }
    });
}
client.on('ready', () => {
    console.log('Authorized for', client.user.username);
    refreshRPC();
});
cron.schedule('*/2 * * * * * *', () => {
    refreshRPC();
});

client.login({ clientId });
