--[[
Gate addresses when ship is in preprogrammed position:
MilkyWay = H999-OVA-19
base = EGUX-RX7-NI
orbit_base = UZQ3-G4G-19
Destiny = OAOH-A2V-19
Othala = 8MR3-ER2-19
Ida = VGVQ-HMX-19
Ori = H9VV-2HV-19
Midway = EMX5-5JZ-19
DIM-331 = RAMK-D1T-19
P2Y-321 = IRC0-YRB-19

]]


internet = require("internet")
term = require("term")
component = require("component")
computer = require("computer")
event = require("event")
term.clear()
term.setCursor(1,1)


function connectCore()
  ship = component.warpdriveShipController
end

function connectRedstone()
  redstone = component.redstone
end

if pcall(connectCore) then --this wraps the hole program

---------------------------Change-------------------
--Ship dimensions
d_Front = 7
d_Back  = 8
d_Right = 12
d_Left  = 3
d_Up    = 6
d_Down  = 2
-----------------------Dont change------------------
  --Front right up
ship.dim_positive(d_Front, d_Right, d_Up)
 
  --Back left down
ship.dim_negative(d_Back, d_Left, d_Down)
----------------------------------------------------

-----------Do for no reason change these!-----------
url = "https://docs.google.com/spreadsheets/d/1-Gt65A1KFmbqph36-CFq6dNlJEtZex0EZXSSg_QPPKo/edit#gid=905815096"
old_text = ""
rep = false
step = 1

baseCoords_X = 259
--baseCoords_Y_parked = 70
baseCoords_Y = 70
baseCoords_Z = 807

orbitBaseCoords_X = -10999
orbitBaseCoords_Y = 247
orbitBaseCoords_Z = -12675

---------Put all functions above while loop and all initializers above this text----------

 

function coordJumpActivator()
  coordJump(destination)
end

function coordJump(destination)
 
  currentPos_X, currentPos_Y, currentPos_Z = ship.position()

----When adding a location, remember to add it to this list, as well as the 2 others on the end of the document----

   if destination == "coord" then
   if tonumber(target_locationX) ~= nil and tonumber(target_locationY) ~= nil and tonumber(target_locationZ) ~= nil then
      target_X = target_locationX
      target_Y = target_locationY
      target_Z = target_locationZ
    else
      print("The x, y and z values must be numbers only!")
      print(target_locationX)
      print(target_locationY)
      print(target_locationZ)
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  end

  if destination == "coord_hyperspace" then
    --This mode is mixed into the main code to change jump mode.
   if ship.isInSpace() == false and ship.isInHyperspace() == false then
     print("Cannot open hyperspace window from within an atmosphere...")
     os.sleep(3)
     pcall(mainLoopActivator)
   end
   if tonumber(target_locationX) ~= nil and tonumber(target_locationY) ~= nil and tonumber(target_locationZ) ~= nil then
      target_X = target_locationX
      target_Y = target_locationY
      target_Z = target_locationZ
    else
      print("The x, y and z values must be numbers only!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  end

  if destination == "orbit_base" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == orbitBaseCoords_X and currentPos_Y == orbitBaseCoords_Y and currentPos_Z == orbitBaseCoords_Z then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = orbitBaseCoords_X
        target_Y = orbitBaseCoords_Y
        target_Z = orbitBaseCoords_Z
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "base" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == orbitBaseCoords_X and currentPos_Y == orbitBaseCoords_Y and currentPos_Z == orbitBaseCoords_Z then
        target_X = orbitBaseCoords_X
        target_Y = orbitBaseCoords_Y - 300
        target_Z = orbitBaseCoords_Z
        rep = true
      else
        target_X = orbitBaseCoords_X
        target_Y = orbitBaseCoords_Y
        target_Z = orbitBaseCoords_Z
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "MilkyWay" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 0 and currentPos_Y == 247 and currentPos_Z == 0 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 0
        target_Y = 247
        target_Z = 0
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "Destiny" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 840000 and currentPos_Y == 247 and currentPos_Z == 840000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 840000
        target_Y = 247
        target_Z = 840000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "Ori" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == -840000 and currentPos_Y == 247 and currentPos_Z == -840000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = -840000
        target_Y = 247
        target_Z = -840000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "Midway" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 60000 and currentPos_Y == 247 and currentPos_Z == 114500 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 60000
        target_Y = 247
        target_Z = 114500
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "Othala" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 340000 and currentPos_Y == 247 and currentPos_Z == -240000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 340000
        target_Y = 247
        target_Z = -240000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "Ida" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 450000 and currentPos_Y == 247 and currentPos_Z == -300000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 450000
        target_Y = 247
        target_Z = -300000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "DIM-331" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == 825000 and currentPos_Y == 247 and currentPos_Z == 840000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = 825000
        target_Y = 247
        target_Z = 840000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end


  if destination == "P2Y-321" then
    if ship.isInSpace() or ship.isInHyperspace() then
      if currentPos_X == -39000 and currentPos_Y == 247 and currentPos_Z == 10000 then
        print("Target reached")
        rep = false
        pcall(mainLoopActivator)
      else
        target_X = -39000
        target_Y = 247
        target_Z = 10000
        rep = true
      end
    elseif ship.isInSpace() == false and ship.isInHyperspace() == false then
      if currentPos_X == baseCoords_X and currentPos_Y == baseCoords_Y and currentPos_Z == baseCoords_Z then
        target_X = baseCoords_X
        target_Y = baseCoords_Y + 900
        target_Z = baseCoords_Z
        rep = true
      else
        target_X = baseCoords_X
        target_Y = baseCoords_Y
        target_Z = baseCoords_Z
        rep = true
      end
    end
  end



  os.sleep(2)
  front = ((target_Z - currentPos_Z) * -1)
  up = (target_Y - currentPos_Y)
  right = (target_X - currentPos_X)




------Check if jump is more then minimal------
if (ship.isInHyperspace() == false and destination ~= "coord") or destination == "coord_hyperspace" then
  if front > 0 then
    if front < (d_Front + d_Back) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  elseif front < 0 then
    if (front * -1) < (d_Front + d_Back) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  end

  if up > 0 then
    if up < (d_Up + d_Down) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  elseif up < 0 then
    if (up * -1) < (d_Up + d_Down) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  end

  if right > 0 then
    if right < (d_Right + d_Left) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  elseif right < 0 then
    if (right * -1) < (d_Right + d_Left) then
      print("Unauthorized action. Cannot jump into myself!")
      os.sleep(3)
      pcall(mainLoopActivator)
    end
  end
end -- hyperspace check

  if pcall(connectCore) then
  
    if summon == "on" then
      ship.summon_all()
    end
    os.sleep(3)

    if (ship.isInHyperspace() and destination ~= "coord_hyperspace") or (ship.isInSpace() and destination == "coord_hyperspace") then
      ship.mode(5)
    else
      ship.mode(1)
    end

    ship.movement(front, up, right)
    ship.rotationSteps(rotationSteps)
    os.sleep(1)
    term.clear()
    term.setCursor(1,1)
    print("Mode:", autojump)
    print("Target X:", target_locationX)
    print("Target Y:", target_locationY)
    print("Target Z:", target_locationZ)
    if rep == true then 
      print("Task running:", "true")
    elseif rep == false then 
      print("Task running:", "false")
    end
    print("")
    print("Jumping to:")
    print("X:", target_X)
    print("Y:", target_Y)
    print("Z:", target_Z)
    os.sleep(0.5)
    print("")
    print("Jumping distance:")
    print("Forwards:", front)
    print("Up:      ", up)
    print("Right:   ", right)
    print("")
    print("jumping...")
    ship.jump();
    os.sleep(5)

    if rep == true then
      if ship.isInHyperspace() then
        print("Cooldown 120 sec")
        cooldown = 120
      else
        print("Cooldown 60 sec")
        cooldown = 60
      end

      while cooldown > 1 do
        os.sleep(1)
        cooldown = cooldown - 1
        term.clear()
        term.setCursor(1, 1)
        print("Cooldown: ", cooldown)
      end
    end -- if rep == true

    mainLoop()
  else --connectCoreIf
    print("core is no longer connected")
    print("rebooting...")
    os.sleep(3)
    computer.shutdown(true)
  end --connectCoreIf

end --coordJump()





-----This will take commands from the web ----
function mainLoopActivator()
  mainLoop()
end

function getG()
  g = response()
end

function mainLoop()

  while true do

    if pcall(connectCore) then

    result, response = pcall(internet.request, url)
    if pcall(getG) then
      if pcall(getG) then

        if g ~= nil then
          file = io.open("../tmp/tempMiner1Info.txt", "w")
          file:write(g)
          file:close()
          os.sleep(0.5)
          text = {}
          file = io.open("../tmp/tempMiner1Info.txt", "r")
          file:read()
          file:read()
          file:read()
          text[1] = tostring(file:read())
          file:close()
          os.sleep(0.5)

          if text[1] ~= old_text then
            old_text = text[1]
            file = io.open("miner1Info.txt", "w")
            file:close()
            os.execute("rm ../miner1Info.txt")
            file = io.open("miner1Info.txt", "w")
            text[1] = string.gsub(text[1], ",", "\n")
            text[1] = string.gsub(text[1], " ", "")
            file:write(text[1])
            file:close()
            os.sleep(0.5)
            file = io.open("miner1Info.txt", "r")
            autojump = file:read()
            target_locationX = tostring(file:read())
            target_locationY = tostring(file:read())
            target_locationZ = tostring(file:read())
            pSummon = file:read()
            liftMode = file:read()
            file:close()

            if autojump == "coord" then
              destination = "coord"
              pcall(coordJumpActivator)


            elseif autojump == "base" then
              destination = "base"
              pcall(coordJumpActivator)
            elseif autojump == "orbit_base" then
              destination = "orbit_base"
              pcall(coordJumpActivator)
            elseif autojump == "Destiny" then
              destination = "Destiny"
              pcall(coordJumpActivator)
            elseif autojump == "Ori" then
              destination = "Ori"
              pcall(coordJumpActivator)
            elseif autojump == "MilkyWay" then
              destination = "MilkyWay"
              pcall(coordJumpActivator)
            elseif autojump == "Ida" then
              destination = "Ida"
              pcall(coordJumpActivator)
            elseif autojump == "Midway" then
              destination = "Midway"
              pcall(coordJumpActivator)
            elseif autojump == "Othala" then
              destination = "Othala"
              pcall(coordJumpActivator)
            elseif autojump == "DIM-331" then
              destination = "DIM-331"
              pcall(coordJumpActivator)
            elseif autojump == "P2Y-321" then
              destination = "P2Y-321"
              pcall(coordJumpActivator)
            elseif autojump == "update" then
              os.execute("pastebin -f get h421c86n ../boot/autorun.lua")
              os.execute("pastebin -f get QZbVas6R ../webRemote.lua")
              computer.shutdown(true)
            end
          end
        end
        term.clear()
        term.setCursor(1,1)
        print("Mode:", autojump)
        print("Target X:", target_locationX)
        print("Target Y:", target_locationY)
        print("Target Z:", target_locationZ)
        if rep == true then 
           print("Task running:", "true")
        elseif rep == false then 
          print("Task running:", "false")
          print("Summon players:", pSummon)
          print("Lift mode:", liftMode)
        end
        os.sleep(0.5)
        if rep == true and autojump == "base" then
          destination = "base"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "orbit_base" then
          destination = "orbit_base"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "Destiny" then
          destination = "Destiny"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "Ori" then
          destination = "Ori"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "Midway" then
          destination = "Midway"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "MilkyWay" then
          destination = "MilkyWay"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "Ida" then
          destination = "Ida"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "Othala" then
          destination = "Othala"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "DIM-331" then
          destination = "DIM-331"
          pcall(coordJumpActivator)
        elseif rep == true and autojump == "P2Y-321" then
          destination = "P2Y-321"
          pcall(coordJumpActivator)
        else
          rep = false
        end -- if rep == true
        if pSummon == "on" then
          ship.summon_all()
        end
    end --pcallG
  end --pcallG
  else -- if pcall(connectCore) then
    print("Error: core not connected")
    os.sleep(3)
    computer.shutdown(true)
  end --if pcall(connectCore)
  
  if pcall(connectRedstone) then
    if liftMode == "up" then
      pcall(redstone.setOutput(4, 0))
    elseif liftMode == "down" then
      pcall(redstone.setOutput(4, 15))
    end
  end

  end --while loop
end --mainLoop

if  pcall(mainLoopActivator) then
  pcall(mainLoopActivator)
else
  pcall(mainLoopActivator)
end

else --connectCore
  print("core not connected")
  os.sleep(3)
  computer.shutdown(true)
end  --connectCore