
usaptool_url = "http://folpindo.usaptool.alphard.dev.usautoparts.com"

module.exports = (robot) ->

    robot.respond /hostlookup (.*)$/i, (msg) ->
        hostname = msg.match[1]
        @exec = require('child_process').exec
        command = "host #{hostname}"
        msg.send "Looking up #{hostname}..."
        msg.send "This is the command #{command}."
        @exec command, (error, stdout, stderr) ->
            msg.send error
            msg.send stdout
            msg.send stderr

    robot.respond /test (.*)$/i, (msg) ->
        msg.send "Hello Test"

    robot.respond /curl usaptool/i, (msg) ->
        @exec = require('child_process').exec
        command = "curl -k " + usaptool_url
        @exec command, (error, stdout, stderr) ->
            msg.send error
            msg.send stdout
            msg.send stderr
