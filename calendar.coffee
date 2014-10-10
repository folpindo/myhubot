child_process = require('child_process')
module.exports = (robot) ->
    robot.respond /calendar(me)?/i, (msg) ->
        child_process.exec 'cal -h', (error, stdout, stderr) ->
            msg.send(stdout)
