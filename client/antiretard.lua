local checks

RegisterNetEvent('antiretard:set', function(_checks)
  checks = _checks
end)

Citizen.CreateThread(function()
  -- Wait for the server to send us what we should check for.
  repeat
    Citizen.Wait(1000)
  until checks

  while true do
    local ped = PlayerPedId()

    if checks.weapons then
      for i = 1, #checks.weapons.bad do
        local bad = checks.weapons.bad[i]
        if HasPedGotWeapon(ped, bad, true) then
        end
      end

    elseif checks.visible then
      if not IsEntityVisible(ped) then
      end

    elseif checks.invincible then
      local health = GetEntityHealth(ped)

      if health > 1 then
        SetEntityHealth(ped, (health - 1))
      else
        SetEntityHealth(ped, (health + 1))
      end

      if health == GetEntityHealth(ped) then

      end

      SetEntityHealth(ped, health)

    elseif checks.spectator then
      if NetworkIsInSpectatorMode() then

      end
    end

    Citizen.Wait(1000)
  end
end)
