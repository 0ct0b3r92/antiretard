local checkWeapons = true
local checkVisible = true
local checkInvincible = true
local checkSpectator = true

local badWeapons = {
  'weapon_ball',
  'weapon_railgun',
}

Citizen.CreateThread(function()
  local ped = PlayerPedId()

  -- Check for bad weapons.
  if checkWeapons then
    for i = 1, #badWeapons do
      local badWeapon = badWeapons[i]
      if HasPedGotWeapon(ped, badWeapon, true) then
        -- Has a bad weapon, report it.
      end
    end

  -- Check the players visiblity.
  elseif checkVisible then
    if not IsEntityVisible(ped) then
      -- Invisible, report it.
    end

  -- Check  for invincibility.
  elseif checkInvincible then
    local health = GetEntityHealth(ped)

    if health > 1 then
      SetEntityHealth(ped, (health - 1))
    else
      SetEntityHealth(ped, (health + 1))
    end

    if health == GetEntityHealth(ped) then
      -- Health didn't change, report it.
    end

    SetEntityHealth(ped, health)

  -- Check if the player is spectating.
  elseif checkSpectator then
    if NetworkIsInSpectatorMode() then
      -- Spectating, report it.
    end
  end

  Citizen.Wait(1000)
end)
