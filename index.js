const { exec } = require("child_process");
const http = require("http");

console.log("Starting tmate...");

exec("tmate -S /tmp/tmate.sock new-session -d", () => {
  exec("tmate -S /tmp/tmate.sock wait tmate-ready", () => {
    exec(`tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'`, (e, ssh) => {
      console.log("SSH:", ssh.trim());

      exec(`tmate -S /tmp/tmate.sock display -p '#{tmate_web}'`, (e2, web) => {
        console.log("WEB:", web.trim());
      });
    });
  });
});

// Fake server (Railway Web service)
http.createServer((req, res) => {
  res.end("OK");
}).listen(process.env.PORT || 8080);
