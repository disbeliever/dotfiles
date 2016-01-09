function start_handler(event)
   local aid = mp.get_property("aid")
   if aid ~= "no" then
      os.execute("deadbeef_volume_control.sh low")
   end
end

function exit_handler(event)
   os.execute("deadbeef_volume_control.sh full")
end

mp.register_event("file-loaded", start_handler)
mp.register_event("shutdown", exit_handler)
