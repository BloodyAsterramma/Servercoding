local voice = {default = 5.0, shout = 12.0, whisper = 1.0, current = 0, level = nil}

function drawLevel(r, g, b, a)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextScale(0.4, 0.4)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString("| ~b~Voice:~s~ " .. voice.level)
  DrawText(0.173, 0.895)
end

AddEventHandler('onClientMapStart', function()
  if voice.current == 0 then
    NetworkSetTalkerProximity(voice.default)
  elseif voice.current == 1 then
    NetworkSetTalkerProximity(voice.shout)
  elseif voice.current == 2 then
    NetworkSetTalkerProximity(voice.whisper)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1, 20) and IsControlPressed(1, 21) then
      voice.current = (voice.current + 1) % 3
      if voice.current == 0 then
        NetworkSetTalkerProximity(voice.default)
        voice.level = "Normal"
      elseif voice.current == 1 then
        NetworkSetTalkerProximity(voice.shout)
        voice.level = "Shout"
      elseif voice.current == 2 then
        NetworkSetTalkerProximity(voice.whisper)
        voice.level = "Whisper"
      end
    end
    if voice.current == 0 then
      voice.level = "Normal"
    elseif voice.current == 1 then
      voice.level = "Shout"
    elseif voice.current == 2 then
      voice.level = "Whisper"
    end
    if NetworkIsPlayerTalking(PlayerId()) then
      drawLevel(41, 128, 185, 255)
    elseif not NetworkIsPlayerTalking(PlayerId()) then
      drawLevel(255, 255, 255, 255)
    end
  end
end)

function setVoice()
      voice.current = (voice.current + 1) % 3
      if voice.current == 0 then
        NetworkSetTalkerProximity(voice.default)
        voice.level = "Normal"
      elseif voice.current == 1 then
        NetworkSetTalkerProximity(voice.shout)
        voice.level = "Shout"
      elseif voice.current == 2 then
        NetworkSetTalkerProximity(voice.whisper)
        voice.level = "Whisper"
      end
end