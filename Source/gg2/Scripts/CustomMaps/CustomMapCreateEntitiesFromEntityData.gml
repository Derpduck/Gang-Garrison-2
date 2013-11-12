// creates game objects per the list in the entity data
// argument0: entity data

{

var currentPos, entityType, entityX, entityY, wordLength, DIVIDER, DIVREPLACEMENT;
DIVIDER = chr(10);
DIVREPLACEMENT = " ";

argument0+=DIVIDER;

currentPos = 1;

while(string_pos(DIVIDER, argument0) != 0) { // continue until there are no more entities left
  // grab the entity type
  wordLength = string_pos(DIVIDER, argument0) - currentPos;
  entityType = string_copy(argument0, currentPos, wordLength);
  argument0 = string_replace(argument0, DIVIDER, DIVREPLACEMENT);
  currentPos += wordLength + string_length(DIVREPLACEMENT);
  // grab the x coordinate
  wordLength = string_pos(DIVIDER, argument0) - currentPos;
  entityX = real(string_copy(argument0, currentPos, wordLength));
  argument0 = string_replace(argument0, DIVIDER, DIVREPLACEMENT);
  currentPos += wordLength + string_length(DIVREPLACEMENT);
  // grab the y coordinate
  wordLength = string_pos(DIVIDER, argument0) - currentPos;
  entityY = real(string_copy(argument0, currentPos, wordLength));
  argument0 = string_replace(argument0, DIVIDER, DIVREPLACEMENT);
  currentPos += wordLength + string_length(DIVREPLACEMENT);
  
  // This is where the magic happens:
  // Based on what type of entity we just parsed, we create
  // the corresponding game object.  If the particular entity
  // has extra parameters, we should read them here
  // (note: no entities have extra parameters so far, so there's
  // no standard or precedent for how that should happen.  Anyone
  // who implements that should document it clearly for
  // others)
  
  switch(entityType) {
    case "spawnroom":
      instance_create(entityX, entityY, SpawnRoom);
    break;
    case "redspawn":
      instance_create(entityX, entityY, SpawnPointRed);
    break;
    case "redspawn1":
      instance_create(entityX, entityY, SpawnPointRed1);
    break;
    case "redspawn2":
      instance_create(entityX, entityY, SpawnPointRed2);
    break;
    case "redspawn3":
      instance_create(entityX, entityY, SpawnPointRed3);
    break;
    case "redspawn4":
      instance_create(entityX, entityY, SpawnPointRed4);
    break;
    case "bluespawn":
      instance_create(entityX, entityY, SpawnPointBlue);
    break;
    case "bluespawn1":
      instance_create(entityX, entityY, SpawnPointBlue1);
    break;
    case "bluespawn2":
      instance_create(entityX, entityY, SpawnPointBlue2);
    break;
    case "bluespawn3":
      instance_create(entityX, entityY, SpawnPointBlue3);
    break;
    case "bluespawn4":
      instance_create(entityX, entityY, SpawnPointBlue4);
    break;
    case "redintel":
      instance_create(entityX, entityY, IntelligenceBaseRed);
    break;
    case "blueintel":
      instance_create(entityX, entityY, IntelligenceBaseBlue);
    break;
    case "redteamgate":
      instance_create(entityX, entityY, RedTeamGate);
    break;
    case "blueteamgate":
      instance_create(entityX, entityY, BlueTeamGate);
    break;
    case "redteamgate2":
      instance_create(entityX, entityY, RedTeamGate2);
    break;
    case "blueteamgate2":
      instance_create(entityX, entityY, BlueTeamGate2);
    break;
    case "redintelgate":
      instance_create(entityX, entityY, RedIntelGate);
    break;
    case "blueintelgate":
      instance_create(entityX, entityY, BlueIntelGate);
    break;
    case "redintelgate2":
      instance_create(entityX, entityY, RedIntelGate2);
    break;
    case "blueintelgate2":
      instance_create(entityX, entityY, BlueIntelGate2);
    break;
    case "intelgatehorizontal":
      instance_create(entityX, entityY, IntelGateHorizontal);
    break;
    case "intelgatevertical":
      instance_create(entityX, entityY, IntelGateVertical);
    break;
    case "medCabinet":
      instance_create(entityX, entityY, HealingCabinet);
    break;
    case "killbox":
      instance_create(entityX, entityY, KillBox);
    break;
    case "pitfall":
      instance_create(entityX, entityY, PitFall);
    break;
    case "fragbox":
      instance_create(entityX, entityY, FragBox);
    break;
    case "playerwall":
      instance_create(entityX, entityY, PlayerWall);
    break; 
    case "bulletwall":
      instance_create(entityX, entityY, BulletWall);
    break; 
    case "playerwall_horizontal":
      instance_create(entityX, entityY, PlayerWallHorizontal);
    break; 
    case "bulletwall_horizontal":
      instance_create(entityX, entityY, BulletWallHorizontal);
    break;
    case "rightdoor":
      instance_create(entityX, entityY, RightDoor);
    break;
    case "leftdoor":
      instance_create(entityX, entityY, LeftDoor);
    break;
    case "controlPoint5":
      instance_create(entityX, entityY, ControlPoint5);
    break;   
    case "controlPoint4":
      instance_create(entityX, entityY, ControlPoint4);
    break;
    case "controlPoint3":
      instance_create(entityX, entityY, ControlPoint3);
    break;
    case "controlPoint2":
      instance_create(entityX, entityY, ControlPoint2);
    break;
    case "controlPoint1":
      instance_create(entityX, entityY, ControlPoint1);
    break;
    case "NextAreaO":
      instance_create(entityX, entityY, NextAreaO);
    break;
    case "PreviousAreaO":
      instance_create(entityX, entityY, PreviousAreaO);
    break;
    case "CapturePoint":
      instance_create(entityX, entityY, CaptureZone);
    break;
    case "SetupGate":
      instance_create(entityX, entityY, ControlPointSetupGate);
    break;
    case "ArenaControlPoint":
      instance_create(entityX, entityY, ArenaControlPoint);
    break;
    case "GeneratorRed":
      instance_create(entityX, entityY, GeneratorRed);
    break;
    case "GeneratorBlue":
      instance_create(entityX, entityY, GeneratorBlue);
    break;
    case "MoveBoxUp":
      instance_create(entityX, entityY, MoveBoxUp);
    break;
    case "MoveBoxDown":
      instance_create(entityX, entityY, MoveBoxDown);
    break;
    case "MoveBoxLeft":
      instance_create(entityX, entityY, MoveBoxLeft);
    break;
    case "MoveBoxRight":
      instance_create(entityX, entityY, MoveBoxRight);
    break;     
    case "KothControlPoint":
      instance_create(entityX, entityY, KothControlPoint);
    break;
    case "KothRedControlPoint":
      instance_create(entityX, entityY, KothRedControlPoint);
    break;
    case "KothBlueControlPoint":
      instance_create(entityX, entityY, KothBlueControlPoint);
    break;
    case "CustomEnt1":
      instance_create(entityX, entityY, CustomEntity1);
    break;
    case "CustomEnt2":
      instance_create(entityX, entityY, CustomEntity2);
    break;
    case "CustomEnt3":
      instance_create(entityX, entityY, CustomEntity3);
    break;
    case "CustomEnt4":
      instance_create(entityX, entityY, CustomEntity4);
    break;
  }
}
}
