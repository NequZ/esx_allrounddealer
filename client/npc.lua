local koordinaten = {
    {-66.784, -109.98, 0,"Drogendealer",400.77,0x3fb5c3d3,"a_m_m_bevhills_02"}
}


Citizen.CreateThread(function()

    for _,v in pairs(koordinaten) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mp_safehouseseated@male@generic@base")
      while not HasAnimDictLoaded("mp_safehouseseated@male@generic@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mp_safehouseseated@male@generic@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)