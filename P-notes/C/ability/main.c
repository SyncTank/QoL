#include <stdio.h>

typedef struct Ability {
  int ID;
  void *Action; // All abilities do something
  int CoolDown; // 0 for const
  char *description;
  char *icon;
} Slot;

typedef struct MainWeapon {
  Slot Abilities[1]; // 2 abilites on weapons
} Weapon;

typedef struct HotBar {
  Slot Abilities[3]; // 4 slots to fill player choice
  Slot spell[1];     // spells picked up from hub or battle
  Slot consumable;   // picked up from battle or hub
} Bar;

typedef struct NegativeItems {

} Cursed;

typedef struct BounsItems {

} Relics;

typedef struct AgentStats {
  int health;
  int armor;
  float speed;
  float attackspeed;
  float jump;
  float hover;
} Stats;

// issue is that
// list of big nodes
// small data has locations
//

typedef struct {
  struct SmallNode *next;
  struct SmallNode *prev;
} SmallNode;

typedef struct {
  SmallNode node;
  int data;
} BigNode;

void test() { BigNode bnode[5]; }

typedef struct Character {
  int ID;
  Slot Abilities[1]; // 2 Character based Slots
  Weapon mainWeapon; // interchangable?
  Bar bar;           // maps the char slots and weapon slots to bar
  Stats agentStats;
  Relics relicList[10];
  Cursed cursedList[10];
} Agent;

int main(void) {
  printf("Hello World\n");
  Agent O47;
  O47.ID = 0;
  O47.bar.consumable.ID = 1;
}
