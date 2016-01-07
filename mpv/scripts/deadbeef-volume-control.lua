require "mp.msg"

function start_handler(event)
   os.execute("deadbeef_volume_control.sh low")
end

function exit_handler(event)
   os.execute("deadbeef_volume_control.sh full")
end

mp.register_event("file-loaded", start_handler)
mp.register_event("shutdown", exit_handler)
