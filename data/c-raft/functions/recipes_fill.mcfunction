#Remove Items in storage 
data remove storage recipes Items
data remove storage recipebooks Items

#Insert starting recipes in storage 
data modify storage recipes Items insert 0 value {Slot:0b, id: "minecraft:barrier", Count: 1b, tag:{display:{Name:'{"text":"None","color":"red"}'}, RecipeItem: 1b, ResetRecipe: 1b}}
data modify storage recipes Items insert 0 value {Slot:1b, id: "minecraft:string", Count: 1b, tag:{display:{Name:'{"text":"Fiber","color":"white"}'}, RecipeItem: 1b, Fiber: 1b}}
data modify storage recipes Items insert 0 value {Slot:2b, id: "minecraft:lectern", Count: 1b, tag:{display:{Name:'{"text":"Research Table","color":"gold"}'}, RecipeItem: 1b, Research_Table_Item: 1b}}

#Insert recipe books in storage
data modify storage recipebooks Items insert 0 value {Slot:0b, id: "minecraft:written_book", Count: 1b, tag: {RecipeBook: 1b, FiberRecipe: 1b, pages:['{"text":"Fiber recipe\\n\\nLeaves - 4x"}'], title: "Fiber Recipe Book", author: "Creation Table"}}
data modify storage recipebooks Items insert 0 value {Slot:1b, id: "minecraft:written_book", Count: 1b, tag: {RecipeBook: 1b, ResearchTableRecipe: 1b, pages:['{"text":"Research table recipe\\n\\nPlanks - 14x\\nScrap metal - 4x"}'], title: "Research Table Recipe Book", author: "Creation Table"}}


#Insert recipe products in storage
