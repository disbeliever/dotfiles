function set_volume_low()
   os.execute("deadbeef_volume_control.sh low")
end

function set_volume_full()
   os.execute("deadbeef_volume_control.sh full")
end

function start_handler(event)
   local aid = mp.get_property("aid")
   if aid ~= "no" then
      set_volume_low()
   end
end

function exit_handler(event)
   set_volume_full()
end

function on_mute_change(name, value)
   if value == true then
      set_volume_full()
   else
      set_volume_low()
   end
end

mp.register_event("file-loaded", start_handler)
mp.register_event("shutdown", exit_handler)
mp.observe_property("mute", "bool", on_mute_change)
