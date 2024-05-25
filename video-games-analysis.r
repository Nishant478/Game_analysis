{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "bcdd0cbf",
   "metadata": {
    "papermill": {
     "duration": 0.012799,
     "end_time": "2024-05-25T08:32:27.320916",
     "exception": false,
     "start_time": "2024-05-25T08:32:27.308117",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Introduction**\n",
    "\n",
    "Greetings, fellow gamers and data enthusiasts! In this project we are going see the evolution of video games from 1980-2023. Video games, once a niche hobby, have transformed into a global phenomenon, captivating audiences of all ages and backgrounds. \n",
    "\n",
    "Since the release of the first commercial video game, \"Computer Space,\" in 1971, the industry has continued to evolve and expand, with new technologies and platforms constantly being introduced.The rise of online gaming has allowed gamers to connect and play with others from all over the world, creating a global community that is constantly evolving and growing.\n",
    "\n",
    "Our goal is to explore and analyze the dataset, focusing on identifying the most popular game genres, determining the teams that produce the highest number of popular games, and observing how the distribution of these genres and teams has evolved over time. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8039a2d6",
   "metadata": {
    "papermill": {
     "duration": 0.009984,
     "end_time": "2024-05-25T08:32:27.340990",
     "exception": false,
     "start_time": "2024-05-25T08:32:27.331006",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **About Dataset**\n",
    "\n",
    "This dataset contains a list of video games dating from 1980 to 2023, it also provides things such as release dates, user review rating, and critic review rating.\n",
    "\n",
    "Not only can you find the popular games mentioned here but also the obscure indie ones which we have forgotten in time!\n",
    "\n",
    "Backloggd is a video game collection website mixed with social elements to focus on bringing your gaming profile to life. Create a free account to get started on logging the games you've played, and then rating and reviewing as you go! Go into detail with logging platforms, time played, and even a daily journal to keep track your daily gaming progress with playthroughs. It's all tailored to how much you want to log, so that your profile fits you. Then outside of that you can create lists of games, friend other users, follow their activities, and so much more!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cd33e035",
   "metadata": {
    "papermill": {
     "duration": 0.010505,
     "end_time": "2024-05-25T08:32:27.361088",
     "exception": false,
     "start_time": "2024-05-25T08:32:27.350583",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### IMPORTING LIBRARIES\n",
    "\n",
    "first, we will install all the libraries we are going to use in this project and for that we will use pacman importing and install all the libraries. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "14aa15ae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:27.385775Z",
     "iopub.status.busy": "2024-05-25T08:32:27.383270Z",
     "iopub.status.idle": "2024-05-25T08:32:29.225530Z",
     "shell.execute_reply": "2024-05-25T08:32:29.223267Z"
    },
    "papermill": {
     "duration": 1.857491,
     "end_time": "2024-05-25T08:32:29.228326",
     "exception": false,
     "start_time": "2024-05-25T08:32:27.370835",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "pacman::p_load(pacman, tidyverse, ggplot2, dplyr, lubridate, rio, stringr,knitr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ced3790e",
   "metadata": {
    "papermill": {
     "duration": 0.009832,
     "end_time": "2024-05-25T08:32:29.247876",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.238044",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "###  LOADING THE DATASET\n",
    "\n",
    "And now we will import the game database using rio library."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "9b108a18",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.303914Z",
     "iopub.status.busy": "2024-05-25T08:32:29.269260Z",
     "iopub.status.idle": "2024-05-25T08:32:29.418135Z",
     "shell.execute_reply": "2024-05-25T08:32:29.415841Z"
    },
    "papermill": {
     "duration": 0.164208,
     "end_time": "2024-05-25T08:32:29.421435",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.257227",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "games<- import(\"/kaggle/input/popular-video-games-1980-2023/games.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bd119474",
   "metadata": {
    "papermill": {
     "duration": 0.009527,
     "end_time": "2024-05-25T08:32:29.440413",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.430886",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### DATA OVERVIEW\n",
    "\n",
    "We start by getting an overview of the data by displaying the DataFrame and its summary information."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "98a0891b",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.463650Z",
     "iopub.status.busy": "2024-05-25T08:32:29.461679Z",
     "iopub.status.idle": "2024-05-25T08:32:29.561231Z",
     "shell.execute_reply": "2024-05-25T08:32:29.559081Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.116681,
     "end_time": "2024-05-25T08:32:29.566548",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.449867",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>Title</th><th scope=col>Release Date</th><th scope=col>Team</th><th scope=col>Rating</th><th scope=col>Times Listed</th><th scope=col>Number of Reviews</th><th scope=col>Genres</th><th scope=col>Summary</th><th scope=col>Reviews</th><th scope=col>Plays</th><th scope=col>Playing</th><th scope=col>Backlogs</th><th scope=col>Wishlist</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td>Elden Ring                             </td><td>Feb 25, 2022</td><td>['Bandai Namco Entertainment', 'FromSoftware']     </td><td>4.5</td><td>3.9K</td><td>3.9K</td><td>['Adventure', 'RPG']                                </td><td>Elden Ring is a fantasy, action and open world game with RPG elements such as stats, weapons and spells. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             </td><td>[\"\"The first playthrough of elden ring is one of the best eperiences gaming can offer you but after youve explored everything in the open world and you've experienced all of the surprises you lose motivation to go exploring on repeat playthroughs which takes a lot away from the replayability which is a very important thing for from games imo.\"\", 'a replay solidified my love for elden ring. so easily my favorite game of all time. actually beating malenia this time was also an amazing feeling. i just love being in this world man its the greatest of all time', 'The game is absolutely beautiful, with so much to do. The replayability is crazy. And it never gets old with it too.', 'Took everything great about the Soulsborne games and make it 100% better.', 'I play with my overlevelled friend every time and we still fail sometimes (he’s on NG6), insanely difficult game lol\\n                     \\n                     gorgeous graphics, animations, everything about this game is so beautiful. deserves all the hype it gets. If you have a powerful enough pc I definitely recommend you play it on there, if you use keyboard, you’ll want to change the keybinds because the defaults are ass.', \"\"Tied as my favorite souls game with Bloodborne, truly one I'll keep coming back too.\"\"]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              </td><td>17K</td><td>3.8K</td><td>4.6K</td><td>4.8K</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>Hades                                  </td><td>Dec 10, 2019</td><td>['Supergiant Games']                               </td><td>4.3</td><td>2.9K</td><td>2.9K</td><td>['Adventure', 'Brawler', 'Indie', 'RPG']            </td><td>A rogue-lite hack and slash dungeon crawler in which Zagreus, son of Hades the Greek god of the dead, attempts to escape his home and his oppressive father by fighting the souls of the dead through the various layers of the ever-shifting underworld, while getting to know and forging relationships with its inhabitants.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     </td><td>['convinced this is a roguelike for people who do not like the genre. The art is technically good but the aesthetic does very little for me, too clean or something. idk wish I liked it but I do not', 'incredible art, a banger soundtrack a surprisingly charming storyline and a big red dog. hades has very smooth gameplay but after playing it for a while it just feels like youre doing the same 3 hit combo ove and over again, which dont get me wrong that combo feels great to do but once i becomes muscle memory you kinda go into autopilot. also i think the boons are cool but i would like to see them change the flow of combat a bit more, there are some cool ones like the grape boon that can change the way you play but most of them are just upgrades that dont really change the gameplay or strategy. other then those 2 small gripes the game is fantastic.', \"\"People tell me this game gets really really good at some point but i've beaten entire games in the amount of time I gave this game.\"\", 'Não sou muito de jogo indie, admito que joguei poucos, mas devo dizer que Hades foi um dos melhores jogos que joguei na vida, facilmente no top 15. Toda sua arte, dublagem, gameplay, carisma dos personagens, é tudo incrivel', \"\"I can't shake the feeling that I am thoroughly bored playing Hades. I've picked up Hades three times over the last few years, and three times I've found myself putting down the controller after a handful of hours, especially after reaching the third stage, and I couldn't figure out why it wasn't working for me. After giving it a few good goes, I've finally managed to pin down what it is that just doesn't click for me about Hades.\"\", 'One of my favorites in the rogue-likes/lites, only being beat by binding of Isaac. I love the characters (Thanatos my beloved) and the writing and the art style and RRRAAAAHHH THIS GAME IS AWESOME']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               </td><td>21K</td><td>3.2K</td><td>6.3K</td><td>3.6K</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2</td><td>The Legend of Zelda: Breath of the Wild</td><td>Mar 03, 2017</td><td>['Nintendo', 'Nintendo EPD Production Group No. 3']</td><td>4.4</td><td>4.3K</td><td>4.3K</td><td>['Adventure', 'RPG']                                </td><td>The Legend of Zelda: Breath of the Wild is the first 3D open-world game in the Zelda series. Link can travel anywhere and be equipped with weapons and armor found throughout the world to grant him various bonuses. Unlike many games in the series, Breath of the Wild does not impose a specific order in which quests or dungeons must be completed. While the game still has environmental obstacles such as weather effects, inhospitable lands, or powerful enemies, many of them can be overcome using the right method. A lot of critics ranked Breath of the Wild as one of the best video games of all time.                                                                                                                                                                                                            </td><td>['This game is the game (that is not CS:GO) that I have played the most ever. I have played this game for 400 hours.', \"\"A really good switch game, however didn't really grip me like mario odyssey\"\", \"\"i was very disappointed by the final boss fight, but the rest of the game is so good it makes me not want to even do the final boss fight anyway just so i can play more of the game. i do wish that there were more unique mechanics in combat besides just parrying and link's flurry rush, but the world is really pretty and actually incentivizes exploring it. characters are great, story is great and makes you work for it, and there's tons of hidden secrets and details.\"\", 'em 105 horas de jogo não houve um segundo que eu não tava me divertindo e eu acho que isso diz muito', 'Sencillamente el mejor juego que he tenido el placer de disfrutar, esperé 5 años para poder jugarlo y puedo decir que valió cada segundo la espera. No estoy ni cerca de conseguir el 100%, tengo mas de 100 horas y aún estoy descubriendo cosas nuevas. Va más allá de un simple juego, es una experiencia que lamentablemente solo se puede vivir una vez en la vida y la recomiendo totalmente.', 'em meio a tanto jogo de mundo aberto ruim saindo por aí na última década, acho que da pra entender porque breath of the wild chocou tanto as pessoas no ano em que ele lançou. E realmente eu acho que é o melhor mundo aberto que eu já joguei até hoje, explorar cada pedacinho desse mundo é TÃO GOSTOSO, parece que tudo aqui tá no mapa tem um propósito para estar lá, diferente dos mapas vazios da ubisoft por exemplo. Acho que o unico defeito é esses sistema chatinho de durabilidade das armas, ficar trocando de arma o tempo todo é tão chato, espero que no próximo não tenha.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   </td><td>30K</td><td>2.5K</td><td>5K  </td><td>2.6K</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>3</td><td>Undertale                              </td><td>Sep 15, 2015</td><td>['tobyfox', '8-4']                                 </td><td>4.2</td><td>3.5K</td><td>3.5K</td><td>['Adventure', 'Indie', 'RPG', 'Turn Based Strategy']</td><td>A small child falls into the Underground, where monsters have long been banished by humans and are hunting every human that they find. The player controls the child as they try to make it back to the Surface through hostile environments, all the while engaging with a turn-based combat system with puzzle-solving and bullet hell elements, as well as other unconventional game mechanics.                                                                                                                                                                                                                                                                                                                                                                                                                                  </td><td>['soundtrack is tied for #1 with nier automata.  a super charming story and characters which have become iconic. and all that made by 1 man. thats it, thats the review i have no criticisms', 'Just play this game, Dont look at any of these reviews, just pick the game up and know nothing else about it if you are one of the lucky ones that didnt get spoiled on the game. It will fucking break you in the best of ways', 'Não há palavras que deem para descrever a experiência que foi esse jogo.', 'CLASSSSSSSSSSSSSSSICCCCCCCCCCCCCCCCCCC', 'whooaa ohh ohhhh ohoohhohh ohhwooaah story of undertale', 'A nice unique take on the RPG indie game format by incorporating really good ideas, funny interactions, an incredibly subtle story, and wonderful music. Definitely a must play if you have not already.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </td><td>28K</td><td>679 </td><td>4.9K</td><td>1.8K</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>4</td><td>Hollow Knight                          </td><td>Feb 24, 2017</td><td>['Team Cherry']                                    </td><td>4.4</td><td>3K  </td><td>3K  </td><td>['Adventure', 'Indie', 'Platform']                  </td><td>A 2D metroidvania with an emphasis on close combat and exploration in which the player enters the once-prosperous now-bleak insect kingdom of Hallownest, travels through its various districts, meets friendly inhabitants, fights hostile ones and uncovers the kingdom's history while improving their combat abilities and movement arsenal by fighting bosses and accessing out-of-the-way areas.                                                                                                                                                                                                                                                                                                                                                                                                                              </td><td>[\"\"this games worldbuilding is incredible, with its amazing soundtrack and gorgeous art direction it really makes you feel like you're spiderman.  one of the best value in gaming tbh, this game is packed full of content and none of it feels like filler. even the boss rush manages to feel fresh by introducing some surprise bosses/boss variants as rewards for beating tough pantheons. cant wait to play silksong when i turn 80!\"\", \"\"This isn't just a game, this is an entire experience.\\n                     \\n                     I was not too much into Metroidvania games and then I tried this without any expectation, it became one of my favorite games of all time and brought me into the genre, now I'm seeking for similar adventures and I can't wait for Silksong.\\n                     \\n                     I've done all 112% in my first run and now I'm beating the game again, then I'll aim to master the game on Steam, and this is the first time a game instigated me to do that. Masterpiece.\"\", 'Faz uns 2/3 anos que eu zerei esse jogo, mesmo assim nunca saiu da minha memória.\\n                     \\n                     Vou rejogar para fazer uma análise mais aprofundada', 'i like how you can bounce on spikes with your nail. a good casual game that offers additional challenges for people that are socially challenged', 'A rivetting action/adventure game with a stunning design. Extremely rewarding but also gruesomly difficult at times.', 'I\\'d give this game a 4 for each individual aspect (platforming, exploration, combat) but the integration and packaging of the content are so good, it\\'s slightly better that the sum of its parts. Most of the combat and traversal abilities feel useful, and many evoke that Super Metroid-y, gleeful feeling that you\\'ll finally be able to access that new area, grab that item, or beat that boss. The end-game challenges, reminiscent of Wiley\\'s fortress and boss rushes after Megaman has fully self-actualized, were the highlight. Boss rushes in particular were fun to dissect and master. I found uses for some charms I had written off as \"\"not my style\"\" to counter some of the unconventional boss mechanics. My only gripes:\\n                     \\n                     -The repeated backtracking. I get it - a fast-travel mechanic that\\'s too liberal can erase the environment, but this was excessive.\\n                     \\n                     -Some of the charms seemed worthless, even after strategizing for boss, combat, and platforming rushes.\\n                     \\n                     -In the name of decency and civility, make geo-sucking ability automatic.']</td><td>21K</td><td>2.4K</td><td>8.3K</td><td>2.3K</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>5</td><td>Minecraft                              </td><td>Nov 18, 2011</td><td>['Mojang Studios']                                 </td><td>4.3</td><td>2.3K</td><td>2.3K</td><td>['Adventure', 'Simulator']                          </td><td>Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game's open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon.</td><td>['Minecraft is what you make of it. Unfortunately theres no reason to do anything.', 'muito bom, vc pode construir, usar sua imaginação, mods, sobreviver, jogar multiplayer e até zerar o jogo! minecraft é um jogo incrível e fica melhor a cada atualização, (nunca zerei mesmo depois de muitos anos)', 'Jogo incrível, muito divertido, e com amigos fica ainda mais legal.', 'baby gammeeee 😭\\n                     \\n                     had the most fun playing when it was first released sory\\n                     \\n                     still fun for a couple of hours when playing with people tho! 😁', 'Майнкрафт сука это моя жизнь блядь! МАЙНКРААААФТ!!! Ой, мама пришла.', 'E um game maneiro mais jogar ele sem amigos ou sem mods é meio chato']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </td><td>33K</td><td>1.8K</td><td>1.1K</td><td>230 </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & V1 & Title & Release Date & Team & Rating & Times Listed & Number of Reviews & Genres & Summary & Reviews & Plays & Playing & Backlogs & Wishlist\\\\\n",
       "  & <int> & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 0 & Elden Ring                              & Feb 25, 2022 & {[}'Bandai Namco Entertainment', 'FromSoftware'{]}      & 4.5 & 3.9K & 3.9K & {[}'Adventure', 'RPG'{]}                                 & Elden Ring is a fantasy, action and open world game with RPG elements such as stats, weapons and spells. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              & {[}\"\"The first playthrough of elden ring is one of the best eperiences gaming can offer you but after youve explored everything in the open world and you've experienced all of the surprises you lose motivation to go exploring on repeat playthroughs which takes a lot away from the replayability which is a very important thing for from games imo.\"\", 'a replay solidified my love for elden ring. so easily my favorite game of all time. actually beating malenia this time was also an amazing feeling. i just love being in this world man its the greatest of all time', 'The game is absolutely beautiful, with so much to do. The replayability is crazy. And it never gets old with it too.', 'Took everything great about the Soulsborne games and make it 100\\% better.', 'I play with my overlevelled friend every time and we still fail sometimes (he’s on NG6), insanely difficult game lol\\textbackslash{}n                     \\textbackslash{}n                     gorgeous graphics, animations, everything about this game is so beautiful. deserves all the hype it gets. If you have a powerful enough pc I definitely recommend you play it on there, if you use keyboard, you’ll want to change the keybinds because the defaults are ass.', \"\"Tied as my favorite souls game with Bloodborne, truly one I'll keep coming back too.\"\"{]}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               & 17K & 3.8K & 4.6K & 4.8K\\\\\n",
       "\t2 & 1 & Hades                                   & Dec 10, 2019 & {[}'Supergiant Games'{]}                                & 4.3 & 2.9K & 2.9K & {[}'Adventure', 'Brawler', 'Indie', 'RPG'{]}             & A rogue-lite hack and slash dungeon crawler in which Zagreus, son of Hades the Greek god of the dead, attempts to escape his home and his oppressive father by fighting the souls of the dead through the various layers of the ever-shifting underworld, while getting to know and forging relationships with its inhabitants.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      & {[}'convinced this is a roguelike for people who do not like the genre. The art is technically good but the aesthetic does very little for me, too clean or something. idk wish I liked it but I do not', 'incredible art, a banger soundtrack a surprisingly charming storyline and a big red dog. hades has very smooth gameplay but after playing it for a while it just feels like youre doing the same 3 hit combo ove and over again, which dont get me wrong that combo feels great to do but once i becomes muscle memory you kinda go into autopilot. also i think the boons are cool but i would like to see them change the flow of combat a bit more, there are some cool ones like the grape boon that can change the way you play but most of them are just upgrades that dont really change the gameplay or strategy. other then those 2 small gripes the game is fantastic.', \"\"People tell me this game gets really really good at some point but i've beaten entire games in the amount of time I gave this game.\"\", 'Não sou muito de jogo indie, admito que joguei poucos, mas devo dizer que Hades foi um dos melhores jogos que joguei na vida, facilmente no top 15. Toda sua arte, dublagem, gameplay, carisma dos personagens, é tudo incrivel', \"\"I can't shake the feeling that I am thoroughly bored playing Hades. I've picked up Hades three times over the last few years, and three times I've found myself putting down the controller after a handful of hours, especially after reaching the third stage, and I couldn't figure out why it wasn't working for me. After giving it a few good goes, I've finally managed to pin down what it is that just doesn't click for me about Hades.\"\", 'One of my favorites in the rogue-likes/lites, only being beat by binding of Isaac. I love the characters (Thanatos my beloved) and the writing and the art style and RRRAAAAHHH THIS GAME IS AWESOME'{]}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                & 21K & 3.2K & 6.3K & 3.6K\\\\\n",
       "\t3 & 2 & The Legend of Zelda: Breath of the Wild & Mar 03, 2017 & {[}'Nintendo', 'Nintendo EPD Production Group No. 3'{]} & 4.4 & 4.3K & 4.3K & {[}'Adventure', 'RPG'{]}                                 & The Legend of Zelda: Breath of the Wild is the first 3D open-world game in the Zelda series. Link can travel anywhere and be equipped with weapons and armor found throughout the world to grant him various bonuses. Unlike many games in the series, Breath of the Wild does not impose a specific order in which quests or dungeons must be completed. While the game still has environmental obstacles such as weather effects, inhospitable lands, or powerful enemies, many of them can be overcome using the right method. A lot of critics ranked Breath of the Wild as one of the best video games of all time.                                                                                                                                                                                                             & {[}'This game is the game (that is not CS:GO) that I have played the most ever. I have played this game for 400 hours.', \"\"A really good switch game, however didn't really grip me like mario odyssey\"\", \"\"i was very disappointed by the final boss fight, but the rest of the game is so good it makes me not want to even do the final boss fight anyway just so i can play more of the game. i do wish that there were more unique mechanics in combat besides just parrying and link's flurry rush, but the world is really pretty and actually incentivizes exploring it. characters are great, story is great and makes you work for it, and there's tons of hidden secrets and details.\"\", 'em 105 horas de jogo não houve um segundo que eu não tava me divertindo e eu acho que isso diz muito', 'Sencillamente el mejor juego que he tenido el placer de disfrutar, esperé 5 años para poder jugarlo y puedo decir que valió cada segundo la espera. No estoy ni cerca de conseguir el 100\\%, tengo mas de 100 horas y aún estoy descubriendo cosas nuevas. Va más allá de un simple juego, es una experiencia que lamentablemente solo se puede vivir una vez en la vida y la recomiendo totalmente.', 'em meio a tanto jogo de mundo aberto ruim saindo por aí na última década, acho que da pra entender porque breath of the wild chocou tanto as pessoas no ano em que ele lançou. E realmente eu acho que é o melhor mundo aberto que eu já joguei até hoje, explorar cada pedacinho desse mundo é TÃO GOSTOSO, parece que tudo aqui tá no mapa tem um propósito para estar lá, diferente dos mapas vazios da ubisoft por exemplo. Acho que o unico defeito é esses sistema chatinho de durabilidade das armas, ficar trocando de arma o tempo todo é tão chato, espero que no próximo não tenha.'{]}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    & 30K & 2.5K & 5K   & 2.6K\\\\\n",
       "\t4 & 3 & Undertale                               & Sep 15, 2015 & {[}'tobyfox', '8-4'{]}                                  & 4.2 & 3.5K & 3.5K & {[}'Adventure', 'Indie', 'RPG', 'Turn Based Strategy'{]} & A small child falls into the Underground, where monsters have long been banished by humans and are hunting every human that they find. The player controls the child as they try to make it back to the Surface through hostile environments, all the while engaging with a turn-based combat system with puzzle-solving and bullet hell elements, as well as other unconventional game mechanics.                                                                                                                                                                                                                                                                                                                                                                                                                                   & {[}'soundtrack is tied for \\#1 with nier automata.  a super charming story and characters which have become iconic. and all that made by 1 man. thats it, thats the review i have no criticisms', 'Just play this game, Dont look at any of these reviews, just pick the game up and know nothing else about it if you are one of the lucky ones that didnt get spoiled on the game. It will fucking break you in the best of ways', 'Não há palavras que deem para descrever a experiência que foi esse jogo.', 'CLASSSSSSSSSSSSSSSICCCCCCCCCCCCCCCCCCC', 'whooaa ohh ohhhh ohoohhohh ohhwooaah story of undertale', 'A nice unique take on the RPG indie game format by incorporating really good ideas, funny interactions, an incredibly subtle story, and wonderful music. Definitely a must play if you have not already.'{]}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        & 28K & 679  & 4.9K & 1.8K\\\\\n",
       "\t5 & 4 & Hollow Knight                           & Feb 24, 2017 & {[}'Team Cherry'{]}                                     & 4.4 & 3K   & 3K   & {[}'Adventure', 'Indie', 'Platform'{]}                   & A 2D metroidvania with an emphasis on close combat and exploration in which the player enters the once-prosperous now-bleak insect kingdom of Hallownest, travels through its various districts, meets friendly inhabitants, fights hostile ones and uncovers the kingdom's history while improving their combat abilities and movement arsenal by fighting bosses and accessing out-of-the-way areas.                                                                                                                                                                                                                                                                                                                                                                                                                               & {[}\"\"this games worldbuilding is incredible, with its amazing soundtrack and gorgeous art direction it really makes you feel like you're spiderman.  one of the best value in gaming tbh, this game is packed full of content and none of it feels like filler. even the boss rush manages to feel fresh by introducing some surprise bosses/boss variants as rewards for beating tough pantheons. cant wait to play silksong when i turn 80!\"\", \"\"This isn't just a game, this is an entire experience.\\textbackslash{}n                     \\textbackslash{}n                     I was not too much into Metroidvania games and then I tried this without any expectation, it became one of my favorite games of all time and brought me into the genre, now I'm seeking for similar adventures and I can't wait for Silksong.\\textbackslash{}n                     \\textbackslash{}n                     I've done all 112\\% in my first run and now I'm beating the game again, then I'll aim to master the game on Steam, and this is the first time a game instigated me to do that. Masterpiece.\"\", 'Faz uns 2/3 anos que eu zerei esse jogo, mesmo assim nunca saiu da minha memória.\\textbackslash{}n                     \\textbackslash{}n                     Vou rejogar para fazer uma análise mais aprofundada', 'i like how you can bounce on spikes with your nail. a good casual game that offers additional challenges for people that are socially challenged', 'A rivetting action/adventure game with a stunning design. Extremely rewarding but also gruesomly difficult at times.', 'I\\textbackslash{}'d give this game a 4 for each individual aspect (platforming, exploration, combat) but the integration and packaging of the content are so good, it\\textbackslash{}'s slightly better that the sum of its parts. Most of the combat and traversal abilities feel useful, and many evoke that Super Metroid-y, gleeful feeling that you\\textbackslash{}'ll finally be able to access that new area, grab that item, or beat that boss. The end-game challenges, reminiscent of Wiley\\textbackslash{}'s fortress and boss rushes after Megaman has fully self-actualized, were the highlight. Boss rushes in particular were fun to dissect and master. I found uses for some charms I had written off as \"\"not my style\"\" to counter some of the unconventional boss mechanics. My only gripes:\\textbackslash{}n                     \\textbackslash{}n                     -The repeated backtracking. I get it - a fast-travel mechanic that\\textbackslash{}'s too liberal can erase the environment, but this was excessive.\\textbackslash{}n                     \\textbackslash{}n                     -Some of the charms seemed worthless, even after strategizing for boss, combat, and platforming rushes.\\textbackslash{}n                     \\textbackslash{}n                     -In the name of decency and civility, make geo-sucking ability automatic.'{]} & 21K & 2.4K & 8.3K & 2.3K\\\\\n",
       "\t6 & 5 & Minecraft                               & Nov 18, 2011 & {[}'Mojang Studios'{]}                                  & 4.3 & 2.3K & 2.3K & {[}'Adventure', 'Simulator'{]}                           & Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game's open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon. & {[}'Minecraft is what you make of it. Unfortunately theres no reason to do anything.', 'muito bom, vc pode construir, usar sua imaginação, mods, sobreviver, jogar multiplayer e até zerar o jogo! minecraft é um jogo incrível e fica melhor a cada atualização, (nunca zerei mesmo depois de muitos anos)', 'Jogo incrível, muito divertido, e com amigos fica ainda mais legal.', 'baby gammeeee 😭\\textbackslash{}n                     \\textbackslash{}n                     had the most fun playing when it was first released sory\\textbackslash{}n                     \\textbackslash{}n                     still fun for a couple of hours when playing with people tho! 😁', 'Майнкрафт сука это моя жизнь блядь! МАЙНКРААААФТ!!! Ой, мама пришла.', 'E um game maneiro mais jogar ele sem amigos ou sem mods é meio chato'{]}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        & 33K & 1.8K & 1.1K & 230 \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 14\n",
       "\n",
       "| <!--/--> | V1 &lt;int&gt; | Title &lt;chr&gt; | Release Date &lt;chr&gt; | Team &lt;chr&gt; | Rating &lt;dbl&gt; | Times Listed &lt;chr&gt; | Number of Reviews &lt;chr&gt; | Genres &lt;chr&gt; | Summary &lt;chr&gt; | Reviews &lt;chr&gt; | Plays &lt;chr&gt; | Playing &lt;chr&gt; | Backlogs &lt;chr&gt; | Wishlist &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0 | Elden Ring                              | Feb 25, 2022 | ['Bandai Namco Entertainment', 'FromSoftware']      | 4.5 | 3.9K | 3.9K | ['Adventure', 'RPG']                                 | Elden Ring is a fantasy, action and open world game with RPG elements such as stats, weapons and spells. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | [\"\"The first playthrough of elden ring is one of the best eperiences gaming can offer you but after youve explored everything in the open world and you've experienced all of the surprises you lose motivation to go exploring on repeat playthroughs which takes a lot away from the replayability which is a very important thing for from games imo.\"\", 'a replay solidified my love for elden ring. so easily my favorite game of all time. actually beating malenia this time was also an amazing feeling. i just love being in this world man its the greatest of all time', 'The game is absolutely beautiful, with so much to do. The replayability is crazy. And it never gets old with it too.', 'Took everything great about the Soulsborne games and make it 100% better.', 'I play with my overlevelled friend every time and we still fail sometimes (he’s on NG6), insanely difficult game lol\\n                     \\n                     gorgeous graphics, animations, everything about this game is so beautiful. deserves all the hype it gets. If you have a powerful enough pc I definitely recommend you play it on there, if you use keyboard, you’ll want to change the keybinds because the defaults are ass.', \"\"Tied as my favorite souls game with Bloodborne, truly one I'll keep coming back too.\"\"]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | 17K | 3.8K | 4.6K | 4.8K |\n",
       "| 2 | 1 | Hades                                   | Dec 10, 2019 | ['Supergiant Games']                                | 4.3 | 2.9K | 2.9K | ['Adventure', 'Brawler', 'Indie', 'RPG']             | A rogue-lite hack and slash dungeon crawler in which Zagreus, son of Hades the Greek god of the dead, attempts to escape his home and his oppressive father by fighting the souls of the dead through the various layers of the ever-shifting underworld, while getting to know and forging relationships with its inhabitants.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | ['convinced this is a roguelike for people who do not like the genre. The art is technically good but the aesthetic does very little for me, too clean or something. idk wish I liked it but I do not', 'incredible art, a banger soundtrack a surprisingly charming storyline and a big red dog. hades has very smooth gameplay but after playing it for a while it just feels like youre doing the same 3 hit combo ove and over again, which dont get me wrong that combo feels great to do but once i becomes muscle memory you kinda go into autopilot. also i think the boons are cool but i would like to see them change the flow of combat a bit more, there are some cool ones like the grape boon that can change the way you play but most of them are just upgrades that dont really change the gameplay or strategy. other then those 2 small gripes the game is fantastic.', \"\"People tell me this game gets really really good at some point but i've beaten entire games in the amount of time I gave this game.\"\", 'Não sou muito de jogo indie, admito que joguei poucos, mas devo dizer que Hades foi um dos melhores jogos que joguei na vida, facilmente no top 15. Toda sua arte, dublagem, gameplay, carisma dos personagens, é tudo incrivel', \"\"I can't shake the feeling that I am thoroughly bored playing Hades. I've picked up Hades three times over the last few years, and three times I've found myself putting down the controller after a handful of hours, especially after reaching the third stage, and I couldn't figure out why it wasn't working for me. After giving it a few good goes, I've finally managed to pin down what it is that just doesn't click for me about Hades.\"\", 'One of my favorites in the rogue-likes/lites, only being beat by binding of Isaac. I love the characters (Thanatos my beloved) and the writing and the art style and RRRAAAAHHH THIS GAME IS AWESOME']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 21K | 3.2K | 6.3K | 3.6K |\n",
       "| 3 | 2 | The Legend of Zelda: Breath of the Wild | Mar 03, 2017 | ['Nintendo', 'Nintendo EPD Production Group No. 3'] | 4.4 | 4.3K | 4.3K | ['Adventure', 'RPG']                                 | The Legend of Zelda: Breath of the Wild is the first 3D open-world game in the Zelda series. Link can travel anywhere and be equipped with weapons and armor found throughout the world to grant him various bonuses. Unlike many games in the series, Breath of the Wild does not impose a specific order in which quests or dungeons must be completed. While the game still has environmental obstacles such as weather effects, inhospitable lands, or powerful enemies, many of them can be overcome using the right method. A lot of critics ranked Breath of the Wild as one of the best video games of all time.                                                                                                                                                                                                             | ['This game is the game (that is not CS:GO) that I have played the most ever. I have played this game for 400 hours.', \"\"A really good switch game, however didn't really grip me like mario odyssey\"\", \"\"i was very disappointed by the final boss fight, but the rest of the game is so good it makes me not want to even do the final boss fight anyway just so i can play more of the game. i do wish that there were more unique mechanics in combat besides just parrying and link's flurry rush, but the world is really pretty and actually incentivizes exploring it. characters are great, story is great and makes you work for it, and there's tons of hidden secrets and details.\"\", 'em 105 horas de jogo não houve um segundo que eu não tava me divertindo e eu acho que isso diz muito', 'Sencillamente el mejor juego que he tenido el placer de disfrutar, esperé 5 años para poder jugarlo y puedo decir que valió cada segundo la espera. No estoy ni cerca de conseguir el 100%, tengo mas de 100 horas y aún estoy descubriendo cosas nuevas. Va más allá de un simple juego, es una experiencia que lamentablemente solo se puede vivir una vez en la vida y la recomiendo totalmente.', 'em meio a tanto jogo de mundo aberto ruim saindo por aí na última década, acho que da pra entender porque breath of the wild chocou tanto as pessoas no ano em que ele lançou. E realmente eu acho que é o melhor mundo aberto que eu já joguei até hoje, explorar cada pedacinho desse mundo é TÃO GOSTOSO, parece que tudo aqui tá no mapa tem um propósito para estar lá, diferente dos mapas vazios da ubisoft por exemplo. Acho que o unico defeito é esses sistema chatinho de durabilidade das armas, ficar trocando de arma o tempo todo é tão chato, espero que no próximo não tenha.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 30K | 2.5K | 5K   | 2.6K |\n",
       "| 4 | 3 | Undertale                               | Sep 15, 2015 | ['tobyfox', '8-4']                                  | 4.2 | 3.5K | 3.5K | ['Adventure', 'Indie', 'RPG', 'Turn Based Strategy'] | A small child falls into the Underground, where monsters have long been banished by humans and are hunting every human that they find. The player controls the child as they try to make it back to the Surface through hostile environments, all the while engaging with a turn-based combat system with puzzle-solving and bullet hell elements, as well as other unconventional game mechanics.                                                                                                                                                                                                                                                                                                                                                                                                                                   | ['soundtrack is tied for #1 with nier automata.  a super charming story and characters which have become iconic. and all that made by 1 man. thats it, thats the review i have no criticisms', 'Just play this game, Dont look at any of these reviews, just pick the game up and know nothing else about it if you are one of the lucky ones that didnt get spoiled on the game. It will fucking break you in the best of ways', 'Não há palavras que deem para descrever a experiência que foi esse jogo.', 'CLASSSSSSSSSSSSSSSICCCCCCCCCCCCCCCCCCC', 'whooaa ohh ohhhh ohoohhohh ohhwooaah story of undertale', 'A nice unique take on the RPG indie game format by incorporating really good ideas, funny interactions, an incredibly subtle story, and wonderful music. Definitely a must play if you have not already.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | 28K | 679  | 4.9K | 1.8K |\n",
       "| 5 | 4 | Hollow Knight                           | Feb 24, 2017 | ['Team Cherry']                                     | 4.4 | 3K   | 3K   | ['Adventure', 'Indie', 'Platform']                   | A 2D metroidvania with an emphasis on close combat and exploration in which the player enters the once-prosperous now-bleak insect kingdom of Hallownest, travels through its various districts, meets friendly inhabitants, fights hostile ones and uncovers the kingdom's history while improving their combat abilities and movement arsenal by fighting bosses and accessing out-of-the-way areas.                                                                                                                                                                                                                                                                                                                                                                                                                               | [\"\"this games worldbuilding is incredible, with its amazing soundtrack and gorgeous art direction it really makes you feel like you're spiderman.  one of the best value in gaming tbh, this game is packed full of content and none of it feels like filler. even the boss rush manages to feel fresh by introducing some surprise bosses/boss variants as rewards for beating tough pantheons. cant wait to play silksong when i turn 80!\"\", \"\"This isn't just a game, this is an entire experience.\\n                     \\n                     I was not too much into Metroidvania games and then I tried this without any expectation, it became one of my favorite games of all time and brought me into the genre, now I'm seeking for similar adventures and I can't wait for Silksong.\\n                     \\n                     I've done all 112% in my first run and now I'm beating the game again, then I'll aim to master the game on Steam, and this is the first time a game instigated me to do that. Masterpiece.\"\", 'Faz uns 2/3 anos que eu zerei esse jogo, mesmo assim nunca saiu da minha memória.\\n                     \\n                     Vou rejogar para fazer uma análise mais aprofundada', 'i like how you can bounce on spikes with your nail. a good casual game that offers additional challenges for people that are socially challenged', 'A rivetting action/adventure game with a stunning design. Extremely rewarding but also gruesomly difficult at times.', 'I\\'d give this game a 4 for each individual aspect (platforming, exploration, combat) but the integration and packaging of the content are so good, it\\'s slightly better that the sum of its parts. Most of the combat and traversal abilities feel useful, and many evoke that Super Metroid-y, gleeful feeling that you\\'ll finally be able to access that new area, grab that item, or beat that boss. The end-game challenges, reminiscent of Wiley\\'s fortress and boss rushes after Megaman has fully self-actualized, were the highlight. Boss rushes in particular were fun to dissect and master. I found uses for some charms I had written off as \"\"not my style\"\" to counter some of the unconventional boss mechanics. My only gripes:\\n                     \\n                     -The repeated backtracking. I get it - a fast-travel mechanic that\\'s too liberal can erase the environment, but this was excessive.\\n                     \\n                     -Some of the charms seemed worthless, even after strategizing for boss, combat, and platforming rushes.\\n                     \\n                     -In the name of decency and civility, make geo-sucking ability automatic.'] | 21K | 2.4K | 8.3K | 2.3K |\n",
       "| 6 | 5 | Minecraft                               | Nov 18, 2011 | ['Mojang Studios']                                  | 4.3 | 2.3K | 2.3K | ['Adventure', 'Simulator']                           | Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game's open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon. | ['Minecraft is what you make of it. Unfortunately theres no reason to do anything.', 'muito bom, vc pode construir, usar sua imaginação, mods, sobreviver, jogar multiplayer e até zerar o jogo! minecraft é um jogo incrível e fica melhor a cada atualização, (nunca zerei mesmo depois de muitos anos)', 'Jogo incrível, muito divertido, e com amigos fica ainda mais legal.', 'baby gammeeee 😭\\n                     \\n                     had the most fun playing when it was first released sory\\n                     \\n                     still fun for a couple of hours when playing with people tho! 😁', 'Майнкрафт сука это моя жизнь блядь! МАЙНКРААААФТ!!! Ой, мама пришла.', 'E um game maneiro mais jogar ele sem amigos ou sem mods é meio chato']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | 33K | 1.8K | 1.1K | 230  |\n",
       "\n"
      ],
      "text/plain": [
       "  V1 Title                                   Release Date\n",
       "1 0  Elden Ring                              Feb 25, 2022\n",
       "2 1  Hades                                   Dec 10, 2019\n",
       "3 2  The Legend of Zelda: Breath of the Wild Mar 03, 2017\n",
       "4 3  Undertale                               Sep 15, 2015\n",
       "5 4  Hollow Knight                           Feb 24, 2017\n",
       "6 5  Minecraft                               Nov 18, 2011\n",
       "  Team                                                Rating Times Listed\n",
       "1 ['Bandai Namco Entertainment', 'FromSoftware']      4.5    3.9K        \n",
       "2 ['Supergiant Games']                                4.3    2.9K        \n",
       "3 ['Nintendo', 'Nintendo EPD Production Group No. 3'] 4.4    4.3K        \n",
       "4 ['tobyfox', '8-4']                                  4.2    3.5K        \n",
       "5 ['Team Cherry']                                     4.4    3K          \n",
       "6 ['Mojang Studios']                                  4.3    2.3K        \n",
       "  Number of Reviews Genres                                              \n",
       "1 3.9K              ['Adventure', 'RPG']                                \n",
       "2 2.9K              ['Adventure', 'Brawler', 'Indie', 'RPG']            \n",
       "3 4.3K              ['Adventure', 'RPG']                                \n",
       "4 3.5K              ['Adventure', 'Indie', 'RPG', 'Turn Based Strategy']\n",
       "5 3K                ['Adventure', 'Indie', 'Platform']                  \n",
       "6 2.3K              ['Adventure', 'Simulator']                          \n",
       "  Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             \n",
       "1 Elden Ring is a fantasy, action and open world game with RPG elements such as stats, weapons and spells. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             \n",
       "2 A rogue-lite hack and slash dungeon crawler in which Zagreus, son of Hades the Greek god of the dead, attempts to escape his home and his oppressive father by fighting the souls of the dead through the various layers of the ever-shifting underworld, while getting to know and forging relationships with its inhabitants.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \n",
       "3 The Legend of Zelda: Breath of the Wild is the first 3D open-world game in the Zelda series. Link can travel anywhere and be equipped with weapons and armor found throughout the world to grant him various bonuses. Unlike many games in the series, Breath of the Wild does not impose a specific order in which quests or dungeons must be completed. While the game still has environmental obstacles such as weather effects, inhospitable lands, or powerful enemies, many of them can be overcome using the right method. A lot of critics ranked Breath of the Wild as one of the best video games of all time.                                                                                                                                                                                                            \n",
       "4 A small child falls into the Underground, where monsters have long been banished by humans and are hunting every human that they find. The player controls the child as they try to make it back to the Surface through hostile environments, all the while engaging with a turn-based combat system with puzzle-solving and bullet hell elements, as well as other unconventional game mechanics.                                                                                                                                                                                                                                                                                                                                                                                                                                  \n",
       "5 A 2D metroidvania with an emphasis on close combat and exploration in which the player enters the once-prosperous now-bleak insect kingdom of Hallownest, travels through its various districts, meets friendly inhabitants, fights hostile ones and uncovers the kingdom's history while improving their combat abilities and movement arsenal by fighting bosses and accessing out-of-the-way areas.                                                                                                                                                                                                                                                                                                                                                                                                                              \n",
       "6 Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game's open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon.\n",
       "  Reviews                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              \n",
       "1 [\"\"The first playthrough of elden ring is one of the best eperiences gaming can offer you but after youve explored everything in the open world and you've experienced all of the surprises you lose motivation to go exploring on repeat playthroughs which takes a lot away from the replayability which is a very important thing for from games imo.\"\", 'a replay solidified my love for elden ring. so easily my favorite game of all time. actually beating malenia this time was also an amazing feeling. i just love being in this world man its the greatest of all time', 'The game is absolutely beautiful, with so much to do. The replayability is crazy. And it never gets old with it too.', 'Took everything great about the Soulsborne games and make it 100% better.', 'I play with my overlevelled friend every time and we still fail sometimes (he’s on NG6), insanely difficult game lol\\\\n                     \\\\n                     gorgeous graphics, animations, everything about this game is so beautiful. deserves all the hype it gets. If you have a powerful enough pc I definitely recommend you play it on there, if you use keyboard, you’ll want to change the keybinds because the defaults are ass.', \"\"Tied as my favorite souls game with Bloodborne, truly one I'll keep coming back too.\"\"]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              \n",
       "2 ['convinced this is a roguelike for people who do not like the genre. The art is technically good but the aesthetic does very little for me, too clean or something. idk wish I liked it but I do not', 'incredible art, a banger soundtrack a surprisingly charming storyline and a big red dog. hades has very smooth gameplay but after playing it for a while it just feels like youre doing the same 3 hit combo ove and over again, which dont get me wrong that combo feels great to do but once i becomes muscle memory you kinda go into autopilot. also i think the boons are cool but i would like to see them change the flow of combat a bit more, there are some cool ones like the grape boon that can change the way you play but most of them are just upgrades that dont really change the gameplay or strategy. other then those 2 small gripes the game is fantastic.', \"\"People tell me this game gets really really good at some point but i've beaten entire games in the amount of time I gave this game.\"\", 'Não sou muito de jogo indie, admito que joguei poucos, mas devo dizer que Hades foi um dos melhores jogos que joguei na vida, facilmente no top 15. Toda sua arte, dublagem, gameplay, carisma dos personagens, é tudo incrivel', \"\"I can't shake the feeling that I am thoroughly bored playing Hades. I've picked up Hades three times over the last few years, and three times I've found myself putting down the controller after a handful of hours, especially after reaching the third stage, and I couldn't figure out why it wasn't working for me. After giving it a few good goes, I've finally managed to pin down what it is that just doesn't click for me about Hades.\"\", 'One of my favorites in the rogue-likes/lites, only being beat by binding of Isaac. I love the characters (Thanatos my beloved) and the writing and the art style and RRRAAAAHHH THIS GAME IS AWESOME']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \n",
       "3 ['This game is the game (that is not CS:GO) that I have played the most ever. I have played this game for 400 hours.', \"\"A really good switch game, however didn't really grip me like mario odyssey\"\", \"\"i was very disappointed by the final boss fight, but the rest of the game is so good it makes me not want to even do the final boss fight anyway just so i can play more of the game. i do wish that there were more unique mechanics in combat besides just parrying and link's flurry rush, but the world is really pretty and actually incentivizes exploring it. characters are great, story is great and makes you work for it, and there's tons of hidden secrets and details.\"\", 'em 105 horas de jogo não houve um segundo que eu não tava me divertindo e eu acho que isso diz muito', 'Sencillamente el mejor juego que he tenido el placer de disfrutar, esperé 5 años para poder jugarlo y puedo decir que valió cada segundo la espera. No estoy ni cerca de conseguir el 100%, tengo mas de 100 horas y aún estoy descubriendo cosas nuevas. Va más allá de un simple juego, es una experiencia que lamentablemente solo se puede vivir una vez en la vida y la recomiendo totalmente.', 'em meio a tanto jogo de mundo aberto ruim saindo por aí na última década, acho que da pra entender porque breath of the wild chocou tanto as pessoas no ano em que ele lançou. E realmente eu acho que é o melhor mundo aberto que eu já joguei até hoje, explorar cada pedacinho desse mundo é TÃO GOSTOSO, parece que tudo aqui tá no mapa tem um propósito para estar lá, diferente dos mapas vazios da ubisoft por exemplo. Acho que o unico defeito é esses sistema chatinho de durabilidade das armas, ficar trocando de arma o tempo todo é tão chato, espero que no próximo não tenha.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   \n",
       "4 ['soundtrack is tied for #1 with nier automata.  a super charming story and characters which have become iconic. and all that made by 1 man. thats it, thats the review i have no criticisms', 'Just play this game, Dont look at any of these reviews, just pick the game up and know nothing else about it if you are one of the lucky ones that didnt get spoiled on the game. It will fucking break you in the best of ways', 'Não há palavras que deem para descrever a experiência que foi esse jogo.', 'CLASSSSSSSSSSSSSSSICCCCCCCCCCCCCCCCCCC', 'whooaa ohh ohhhh ohoohhohh ohhwooaah story of undertale', 'A nice unique take on the RPG indie game format by incorporating really good ideas, funny interactions, an incredibly subtle story, and wonderful music. Definitely a must play if you have not already.']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       \n",
       "5 [\"\"this games worldbuilding is incredible, with its amazing soundtrack and gorgeous art direction it really makes you feel like you're spiderman.  one of the best value in gaming tbh, this game is packed full of content and none of it feels like filler. even the boss rush manages to feel fresh by introducing some surprise bosses/boss variants as rewards for beating tough pantheons. cant wait to play silksong when i turn 80!\"\", \"\"This isn't just a game, this is an entire experience.\\\\n                     \\\\n                     I was not too much into Metroidvania games and then I tried this without any expectation, it became one of my favorite games of all time and brought me into the genre, now I'm seeking for similar adventures and I can't wait for Silksong.\\\\n                     \\\\n                     I've done all 112% in my first run and now I'm beating the game again, then I'll aim to master the game on Steam, and this is the first time a game instigated me to do that. Masterpiece.\"\", 'Faz uns 2/3 anos que eu zerei esse jogo, mesmo assim nunca saiu da minha memória.\\\\n                     \\\\n                     Vou rejogar para fazer uma análise mais aprofundada', 'i like how you can bounce on spikes with your nail. a good casual game that offers additional challenges for people that are socially challenged', 'A rivetting action/adventure game with a stunning design. Extremely rewarding but also gruesomly difficult at times.', 'I\\\\'d give this game a 4 for each individual aspect (platforming, exploration, combat) but the integration and packaging of the content are so good, it\\\\'s slightly better that the sum of its parts. Most of the combat and traversal abilities feel useful, and many evoke that Super Metroid-y, gleeful feeling that you\\\\'ll finally be able to access that new area, grab that item, or beat that boss. The end-game challenges, reminiscent of Wiley\\\\'s fortress and boss rushes after Megaman has fully self-actualized, were the highlight. Boss rushes in particular were fun to dissect and master. I found uses for some charms I had written off as \"\"not my style\"\" to counter some of the unconventional boss mechanics. My only gripes:\\\\n                     \\\\n                     -The repeated backtracking. I get it - a fast-travel mechanic that\\\\'s too liberal can erase the environment, but this was excessive.\\\\n                     \\\\n                     -Some of the charms seemed worthless, even after strategizing for boss, combat, and platforming rushes.\\\\n                     \\\\n                     -In the name of decency and civility, make geo-sucking ability automatic.']\n",
       "6 ['Minecraft is what you make of it. Unfortunately theres no reason to do anything.', 'muito bom, vc pode construir, usar sua imaginação, mods, sobreviver, jogar multiplayer e até zerar o jogo! minecraft é um jogo incrível e fica melhor a cada atualização, (nunca zerei mesmo depois de muitos anos)', 'Jogo incrível, muito divertido, e com amigos fica ainda mais legal.', 'baby gammeeee 😭\\\\n                     \\\\n                     had the most fun playing when it was first released sory\\\\n                     \\\\n                     still fun for a couple of hours when playing with people tho! 😁', 'Майнкрафт сука это моя жизнь блядь! МАЙНКРААААФТ!!! Ой, мама пришла.', 'E um game maneiro mais jogar ele sem amigos ou sem mods é meio chato']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       \n",
       "  Plays Playing Backlogs Wishlist\n",
       "1 17K   3.8K    4.6K     4.8K    \n",
       "2 21K   3.2K    6.3K     3.6K    \n",
       "3 30K   2.5K    5K       2.6K    \n",
       "4 28K   679     4.9K     1.8K    \n",
       "5 21K   2.4K    8.3K     2.3K    \n",
       "6 33K   1.8K    1.1K     230     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(games) #display the first few rows of a data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "73e17e59",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.594218Z",
     "iopub.status.busy": "2024-05-25T08:32:29.592154Z",
     "iopub.status.idle": "2024-05-25T08:32:29.692601Z",
     "shell.execute_reply": "2024-05-25T08:32:29.690288Z"
    },
    "papermill": {
     "duration": 0.117102,
     "end_time": "2024-05-25T08:32:29.695438",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.578336",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,512\n",
      "Columns: 14\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Bandai Namco Entertainment', 'FromSoftware']\", …\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Adventure', 'RPG']\", \"['Adventure', 'Brawler', …\n",
      "$ Summary             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring is a fantasy, action and open world ga…\n",
      "$ Reviews             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"[\\\"\\\"The first playthrough of elden ring is one o…\n",
      "$ Plays               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"17K\", \"21K\", \"30K\", \"28K\", \"21K\", \"33K\", \"7.2K\", …\n",
      "$ Playing             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.8K\", \"3.2K\", \"2.5K\", \"679\", \"2.4K\", \"1.8K\", \"1.…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.6K\", \"6.3K\", \"5K\", \"4.9K\", \"8.3K\", \"1.1K\", \"4.5…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.8K\", \"3.6K\", \"2.6K\", \"1.8K\", \"2.3K\", \"230\", \"3.…\n"
     ]
    }
   ],
   "source": [
    "glimpse(games)#To get better overview "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "b789aa17",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.723519Z",
     "iopub.status.busy": "2024-05-25T08:32:29.721598Z",
     "iopub.status.idle": "2024-05-25T08:32:29.748192Z",
     "shell.execute_reply": "2024-05-25T08:32:29.746090Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.043462,
     "end_time": "2024-05-25T08:32:29.751062",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.707600",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "       V1            Title           Release Date           Team          \n",
       " Min.   :   0.0   Length:1512        Length:1512        Length:1512       \n",
       " 1st Qu.: 377.8   Class :character   Class :character   Class :character  \n",
       " Median : 755.5   Mode  :character   Mode  :character   Mode  :character  \n",
       " Mean   : 755.5                                                           \n",
       " 3rd Qu.:1133.2                                                           \n",
       " Max.   :1511.0                                                           \n",
       "                                                                          \n",
       "     Rating      Times Listed       Number of Reviews     Genres         \n",
       " Min.   :0.700   Length:1512        Length:1512        Length:1512       \n",
       " 1st Qu.:3.400   Class :character   Class :character   Class :character  \n",
       " Median :3.800   Mode  :character   Mode  :character   Mode  :character  \n",
       " Mean   :3.719                                                           \n",
       " 3rd Qu.:4.100                                                           \n",
       " Max.   :4.800                                                           \n",
       " NA's   :13                                                              \n",
       "   Summary            Reviews             Plays             Playing         \n",
       " Length:1512        Length:1512        Length:1512        Length:1512       \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   Backlogs           Wishlist        \n",
       " Length:1512        Length:1512       \n",
       " Class :character   Class :character  \n",
       " Mode  :character   Mode  :character  \n",
       "                                      \n",
       "                                      \n",
       "                                      \n",
       "                                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(games)#Display summary information of dataframe"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "480989b8",
   "metadata": {
    "papermill": {
     "duration": 0.01178,
     "end_time": "2024-05-25T08:32:29.774778",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.762998",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Checking for dublicates and null values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c57c6122",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.804168Z",
     "iopub.status.busy": "2024-05-25T08:32:29.801805Z",
     "iopub.status.idle": "2024-05-25T08:32:29.839088Z",
     "shell.execute_reply": "2024-05-25T08:32:29.836885Z"
    },
    "papermill": {
     "duration": 0.05519,
     "end_time": "2024-05-25T08:32:29.841846",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.786656",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "any(duplicated(games))#checking  if there any dublicates in dataframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "3e74b6a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.870839Z",
     "iopub.status.busy": "2024-05-25T08:32:29.868859Z",
     "iopub.status.idle": "2024-05-25T08:32:29.890704Z",
     "shell.execute_reply": "2024-05-25T08:32:29.888340Z"
    },
    "papermill": {
     "duration": 0.040234,
     "end_time": "2024-05-25T08:32:29.893629",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.853395",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "any(is.na(games))#Checking if there any null values in whole dataframe"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "16fa625c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.921586Z",
     "iopub.status.busy": "2024-05-25T08:32:29.919730Z",
     "iopub.status.idle": "2024-05-25T08:32:29.940703Z",
     "shell.execute_reply": "2024-05-25T08:32:29.938593Z"
    },
    "papermill": {
     "duration": 0.037997,
     "end_time": "2024-05-25T08:32:29.943472",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.905475",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "13"
      ],
      "text/latex": [
       "13"
      ],
      "text/markdown": [
       "13"
      ],
      "text/plain": [
       "[1] 13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(is.na(games))#total null values "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "1a32c0ab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:29.971726Z",
     "iopub.status.busy": "2024-05-25T08:32:29.969866Z",
     "iopub.status.idle": "2024-05-25T08:32:29.991564Z",
     "shell.execute_reply": "2024-05-25T08:32:29.989552Z"
    },
    "papermill": {
     "duration": 0.0389,
     "end_time": "2024-05-25T08:32:29.994303",
     "exception": false,
     "start_time": "2024-05-25T08:32:29.955403",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>V1</dt><dd>0</dd><dt>Title</dt><dd>0</dd><dt>Release Date</dt><dd>0</dd><dt>Team</dt><dd>0</dd><dt>Rating</dt><dd>13</dd><dt>Times Listed</dt><dd>0</dd><dt>Number of Reviews</dt><dd>0</dd><dt>Genres</dt><dd>0</dd><dt>Summary</dt><dd>0</dd><dt>Reviews</dt><dd>0</dd><dt>Plays</dt><dd>0</dd><dt>Playing</dt><dd>0</dd><dt>Backlogs</dt><dd>0</dd><dt>Wishlist</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[V1] 0\n",
       "\\item[Title] 0\n",
       "\\item[Release Date] 0\n",
       "\\item[Team] 0\n",
       "\\item[Rating] 13\n",
       "\\item[Times Listed] 0\n",
       "\\item[Number of Reviews] 0\n",
       "\\item[Genres] 0\n",
       "\\item[Summary] 0\n",
       "\\item[Reviews] 0\n",
       "\\item[Plays] 0\n",
       "\\item[Playing] 0\n",
       "\\item[Backlogs] 0\n",
       "\\item[Wishlist] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "V1\n",
       ":   0Title\n",
       ":   0Release Date\n",
       ":   0Team\n",
       ":   0Rating\n",
       ":   13Times Listed\n",
       ":   0Number of Reviews\n",
       ":   0Genres\n",
       ":   0Summary\n",
       ":   0Reviews\n",
       ":   0Plays\n",
       ":   0Playing\n",
       ":   0Backlogs\n",
       ":   0Wishlist\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "               V1             Title      Release Date              Team \n",
       "                0                 0                 0                 0 \n",
       "           Rating      Times Listed Number of Reviews            Genres \n",
       "               13                 0                 0                 0 \n",
       "          Summary           Reviews             Plays           Playing \n",
       "                0                 0                 0                 0 \n",
       "         Backlogs          Wishlist \n",
       "                0                 0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colSums(is.na(games))#count of null values in each column "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "de331277",
   "metadata": {
    "papermill": {
     "duration": 0.012791,
     "end_time": "2024-05-25T08:32:30.019349",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.006558",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### DATA CLEANING AND FORMATING\n",
    "> ##### Removing null values \n",
    "> We observe that there are total 13 null values which are only  in rating column.  So,now we will remove each row which has null values."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "5eb0a584",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.048348Z",
     "iopub.status.busy": "2024-05-25T08:32:30.046368Z",
     "iopub.status.idle": "2024-05-25T08:32:30.096019Z",
     "shell.execute_reply": "2024-05-25T08:32:30.093454Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.067261,
     "end_time": "2024-05-25T08:32:30.098808",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.031547",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,499\n",
      "Columns: 14\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Bandai Namco Entertainment', 'FromSoftware']\", …\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Adventure', 'RPG']\", \"['Adventure', 'Brawler', …\n",
      "$ Summary             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring is a fantasy, action and open world ga…\n",
      "$ Reviews             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"[\\\"\\\"The first playthrough of elden ring is one o…\n",
      "$ Plays               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"17K\", \"21K\", \"30K\", \"28K\", \"21K\", \"33K\", \"7.2K\", …\n",
      "$ Playing             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.8K\", \"3.2K\", \"2.5K\", \"679\", \"2.4K\", \"1.8K\", \"1.…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.6K\", \"6.3K\", \"5K\", \"4.9K\", \"8.3K\", \"1.1K\", \"4.5…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.8K\", \"3.6K\", \"2.6K\", \"1.8K\", \"2.3K\", \"230\", \"3.…\n"
     ]
    }
   ],
   "source": [
    " games_cleaned<-games%>%     #removing null values\n",
    "filter(complete.cases(.))\n",
    "glimpse(games_cleaned)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "977f8e46",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.127722Z",
     "iopub.status.busy": "2024-05-25T08:32:30.125800Z",
     "iopub.status.idle": "2024-05-25T08:32:30.175214Z",
     "shell.execute_reply": "2024-05-25T08:32:30.172632Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.066924,
     "end_time": "2024-05-25T08:32:30.178004",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.111080",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,499\n",
      "Columns: 14\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Bandai Namco Entertainment', 'FromSoftware']\", …\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Adventure', 'RPG']\", \"['Adventure', 'Brawler', …\n",
      "$ Summary             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring is a fantasy, action and open world ga…\n",
      "$ Reviews             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"[\\\"\\\"The first playthrough of elden ring is one o…\n",
      "$ Plays               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"17K\", \"21K\", \"30K\", \"28K\", \"21K\", \"33K\", \"7.2K\", …\n",
      "$ Playing             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.8K\", \"3.2K\", \"2.5K\", \"679\", \"2.4K\", \"1.8K\", \"1.…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.6K\", \"6.3K\", \"5K\", \"4.9K\", \"8.3K\", \"1.1K\", \"4.5…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.8K\", \"3.6K\", \"2.6K\", \"1.8K\", \"2.3K\", \"230\", \"3.…\n"
     ]
    }
   ],
   "source": [
    "games1<- na.omit(games)  #alternative method for removing null values(jfk)\n",
    "glimpse(games1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "6f4cbc9e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.207402Z",
     "iopub.status.busy": "2024-05-25T08:32:30.205484Z",
     "iopub.status.idle": "2024-05-25T08:32:30.226234Z",
     "shell.execute_reply": "2024-05-25T08:32:30.224320Z"
    },
    "papermill": {
     "duration": 0.038617,
     "end_time": "2024-05-25T08:32:30.229028",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.190411",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "any(is.na(games_cleaned)) #checking for null again"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "e6ce3008",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.258882Z",
     "iopub.status.busy": "2024-05-25T08:32:30.257024Z",
     "iopub.status.idle": "2024-05-25T08:32:30.321545Z",
     "shell.execute_reply": "2024-05-25T08:32:30.319647Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.082249,
     "end_time": "2024-05-25T08:32:30.324039",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.241790",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 13 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>V1</th><th scope=col>Title</th><th scope=col>Release Date</th><th scope=col>Team</th><th scope=col>Rating</th><th scope=col>Times Listed</th><th scope=col>Number of Reviews</th><th scope=col>Genres</th><th scope=col>Summary</th><th scope=col>Reviews</th><th scope=col>Plays</th><th scope=col>Playing</th><th scope=col>Backlogs</th><th scope=col>Wishlist</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td> 587</td><td>Final Fantasy XVI                                </td><td>Jun 22, 2023   </td><td>['Square Enix', 'Square Enix Creative Business Unit III']</td><td>NA</td><td>422</td><td>422</td><td>['RPG']                        </td><td>Final Fantasy XVI is an upcoming action role-playing game developed and published by Square Enix. It is the sixteenth game in the mainline Final Fantasy series and will be released for the PlayStation 5. It is being produced by Naoki Yoshida and directed by Hiroshi Takai.                                                                                                                                                                                                                                                                                                                                                                                                                                                             </td><td>[]                                                                                              </td><td>37</td><td>10</td><td>732 </td><td>2.4K</td></tr>\n",
       "\t<tr><td> 649</td><td>Death Stranding 2                                </td><td>releases on TBD</td><td>['Kojima Productions']                                   </td><td>NA</td><td>105</td><td>105</td><td>['Adventure', 'Shooter']       </td><td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             </td><td>[]                                                                                              </td><td>3 </td><td>0 </td><td>209 </td><td>644 </td></tr>\n",
       "\t<tr><td> 713</td><td>Final Fantasy VII Rebirth                        </td><td>Dec 31, 2023   </td><td>['Square Enix']                                          </td><td>NA</td><td>192</td><td>192</td><td>[]                             </td><td>This next standalone chapter in the FINAL FANTASY VII remake trilogy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         </td><td>[]                                                                                              </td><td>20</td><td>3 </td><td>354 </td><td>1.1K</td></tr>\n",
       "\t<tr><td> 719</td><td>Lies of P                                        </td><td>Aug 01, 2023   </td><td>['NEOWIZ', 'Round8 Studio']                              </td><td>NA</td><td>175</td><td>175</td><td>['RPG']                        </td><td>Inspired by the familiar story of Pinocchio, Lies of P is an action souls-like game set in a dark Belle Époque world. Guide Pinocchio on his unrelenting journey to become human.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </td><td>[]                                                                                              </td><td>5 </td><td>0 </td><td>260 </td><td>939 </td></tr>\n",
       "\t<tr><td> 726</td><td>Judas                                            </td><td>Mar 31, 2025   </td><td>['Ghost Story Games']                                    </td><td>NA</td><td>90 </td><td>90 </td><td>['Adventure', 'Shooter']       </td><td>A disintegrating starship. A desperate escape plan. You are the mysterious and troubled Judas. Your only hope for survival is to make or break alliances with your worst enemies. Will you work together to fix what you broke – or will you leave it to burn?                                                                                                                                                                                                                                                                                                                                                                                                                                                                               </td><td>[]                                                                                              </td><td>1 </td><td>0 </td><td>92  </td><td>437 </td></tr>\n",
       "\t<tr><td> 746</td><td>Like a Dragon Gaiden: The Man Who Erased His Name</td><td>Dec 31, 2023   </td><td>['Ryū Ga Gotoku Studios', 'Sega']                        </td><td>NA</td><td>118</td><td>118</td><td>['Adventure', 'Brawler', 'RPG']</td><td>This game covers Kiryu's story between Yakuza 7 and Like a Dragon 8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         </td><td>[]                                                                                              </td><td>2 </td><td>1 </td><td>145 </td><td>588 </td></tr>\n",
       "\t<tr><td> 972</td><td>The Legend of Zelda: Tears of the Kingdom        </td><td>May 12, 2023   </td><td>['Nintendo', 'Nintendo EPD Production Group No. 3']      </td><td>NA</td><td>581</td><td>581</td><td>['Adventure', 'RPG']           </td><td>The Legend of Zelda: Tears of the Kingdom is the sequel to The Legend of Zelda: Breath of the Wild. The setting for Link’s adventure has been expanded to include the skies above the vast lands of Hyrule.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  </td><td>[]                                                                                              </td><td>72</td><td>6 </td><td>1.6K</td><td>5.4K</td></tr>\n",
       "\t<tr><td>1130</td><td>Star Wars Jedi: Survivor                         </td><td>Apr 28, 2023   </td><td>['Respawn Entertainment', 'Electronic Arts']             </td><td>NA</td><td>250</td><td>250</td><td>['Adventure']                  </td><td>The story of Cal Kestis continues in Star Wars Jedi: Survivor, a third-person, galaxy-spanning, action-adventure game from Respawn Entertainment, developed in collaboration with Lucasfilm Games. This narratively driven, single-player title picks up five years after the events of Star Wars Jedi: Fallen Order and follows Cal’s increasingly desperate fight as the galaxy descends further into darkness. Pushed to the edges of the galaxy by the Empire, Cal will find himself surrounded by threats new and familiar. As one of the last surviving Jedi Knights, Cal is driven to make a stand during the galaxy’s darkest times — but how far is he willing to go to protect himself, his crew, and the legacy of the Jedi Order?</td><td>[]                                                                                              </td><td>13</td><td>2 </td><td>367 </td><td>1.4K</td></tr>\n",
       "\t<tr><td>1160</td><td>We Love Katamari Reroll + Royal Reverie          </td><td>Jun 02, 2023   </td><td>['Bandai Namco Entertainment', 'MONKEYCRAFT Co. Ltd']    </td><td>NA</td><td>51 </td><td>51 </td><td>['Adventure', 'Puzzle']        </td><td>We Love Katamari Reroll + Royal Reverie is a remake of the PS2 game We Love Katamari.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </td><td>[]                                                                                              </td><td>3 </td><td>0 </td><td>74  </td><td>291 </td></tr>\n",
       "\t<tr><td>1202</td><td>Earthblade                                       </td><td>Dec 31, 2024   </td><td>['Extremely OK Games']                                   </td><td>NA</td><td>83 </td><td>83 </td><td>['Adventure', 'Indie', 'RPG']  </td><td>You are Névoa, an enigmatic child of Fate returning at long last to Earth, in this explor-action platformer from the creators of Celeste. Earthblade's lush pixel art world offers seamless exploration, challenging combat, and countless mysteries to pick apart.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          </td><td>[]                                                                                              </td><td>0 </td><td>1 </td><td>103 </td><td>529 </td></tr>\n",
       "\t<tr><td>1305</td><td>Diablo IV                                        </td><td>Jun 06, 2023   </td><td>['Blizzard Entertainment']                               </td><td>NA</td><td>148</td><td>148</td><td>['Brawler', 'RPG']             </td><td>Endless demons to slaughter. Deep customization through Talents, Skill Points, Runes, and Legendary loot. Randomized dungeons contained in a dynamic open world. Survive and conquer darkness—or succumb to the shadows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     </td><td>[]                                                                                              </td><td>19</td><td>10</td><td>179 </td><td>677 </td></tr>\n",
       "\t<tr><td>1341</td><td>Pac-Man in a Tin                                 </td><td>Mar 22, 2023   </td><td>['Fizz Creations']                                       </td><td>NA</td><td>0  </td><td>0  </td><td>['Arcade']                     </td><td>Pac-Man in a Tin is a pocket-sized tin contains the classic arcade game in all its 8-bit glory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              </td><td>[]                                                                                              </td><td>1 </td><td>0 </td><td>1   </td><td>2   </td></tr>\n",
       "\t<tr><td>1349</td><td>Pokémon Añil                                     </td><td>Mar 23, 2023   </td><td>['Eric Lost']                                            </td><td>NA</td><td>2  </td><td>2  </td><td>['RPG']                        </td><td>Pokémon Añil is the fourth video game created by EricLostie after \"\"Pokémon Opalo\"\". Kanto returns, but this time from a perspective never seen before, with a much deeper story and improved graphics.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      </td><td>['pokemon HWHAT', 'Finally, after all these years... Pokémon Anal. Thanks Nintendo, very cool.']</td><td>1 </td><td>0 </td><td>1   </td><td>7   </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 13 × 14\n",
       "\\begin{tabular}{llllllllllllll}\n",
       " V1 & Title & Release Date & Team & Rating & Times Listed & Number of Reviews & Genres & Summary & Reviews & Plays & Playing & Backlogs & Wishlist\\\\\n",
       " <int> & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t  587 & Final Fantasy XVI                                 & Jun 22, 2023    & {[}'Square Enix', 'Square Enix Creative Business Unit III'{]} & NA & 422 & 422 & {[}'RPG'{]}                         & Final Fantasy XVI is an upcoming action role-playing game developed and published by Square Enix. It is the sixteenth game in the mainline Final Fantasy series and will be released for the PlayStation 5. It is being produced by Naoki Yoshida and directed by Hiroshi Takai.                                                                                                                                                                                                                                                                                                                                                                                                                                                              & {[}{]}                                                                                               & 37 & 10 & 732  & 2.4K\\\\\n",
       "\t  649 & Death Stranding 2                                 & releases on TBD & {[}'Kojima Productions'{]}                                    & NA & 105 & 105 & {[}'Adventure', 'Shooter'{]}        &                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               & {[}{]}                                                                                               & 3  & 0  & 209  & 644 \\\\\n",
       "\t  713 & Final Fantasy VII Rebirth                         & Dec 31, 2023    & {[}'Square Enix'{]}                                           & NA & 192 & 192 & {[}{]}                              & This next standalone chapter in the FINAL FANTASY VII remake trilogy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          & {[}{]}                                                                                               & 20 & 3  & 354  & 1.1K\\\\\n",
       "\t  719 & Lies of P                                         & Aug 01, 2023    & {[}'NEOWIZ', 'Round8 Studio'{]}                               & NA & 175 & 175 & {[}'RPG'{]}                         & Inspired by the familiar story of Pinocchio, Lies of P is an action souls-like game set in a dark Belle Époque world. Guide Pinocchio on his unrelenting journey to become human.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             & {[}{]}                                                                                               & 5  & 0  & 260  & 939 \\\\\n",
       "\t  726 & Judas                                             & Mar 31, 2025    & {[}'Ghost Story Games'{]}                                     & NA & 90  & 90  & {[}'Adventure', 'Shooter'{]}        & A disintegrating starship. A desperate escape plan. You are the mysterious and troubled Judas. Your only hope for survival is to make or break alliances with your worst enemies. Will you work together to fix what you broke – or will you leave it to burn?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                & {[}{]}                                                                                               & 1  & 0  & 92   & 437 \\\\\n",
       "\t  746 & Like a Dragon Gaiden: The Man Who Erased His Name & Dec 31, 2023    & {[}'Ryū Ga Gotoku Studios', 'Sega'{]}                         & NA & 118 & 118 & {[}'Adventure', 'Brawler', 'RPG'{]} & This game covers Kiryu's story between Yakuza 7 and Like a Dragon 8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          & {[}{]}                                                                                               & 2  & 1  & 145  & 588 \\\\\n",
       "\t  972 & The Legend of Zelda: Tears of the Kingdom         & May 12, 2023    & {[}'Nintendo', 'Nintendo EPD Production Group No. 3'{]}       & NA & 581 & 581 & {[}'Adventure', 'RPG'{]}            & The Legend of Zelda: Tears of the Kingdom is the sequel to The Legend of Zelda: Breath of the Wild. The setting for Link’s adventure has been expanded to include the skies above the vast lands of Hyrule.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   & {[}{]}                                                                                               & 72 & 6  & 1.6K & 5.4K\\\\\n",
       "\t 1130 & Star Wars Jedi: Survivor                          & Apr 28, 2023    & {[}'Respawn Entertainment', 'Electronic Arts'{]}              & NA & 250 & 250 & {[}'Adventure'{]}                   & The story of Cal Kestis continues in Star Wars Jedi: Survivor, a third-person, galaxy-spanning, action-adventure game from Respawn Entertainment, developed in collaboration with Lucasfilm Games. This narratively driven, single-player title picks up five years after the events of Star Wars Jedi: Fallen Order and follows Cal’s increasingly desperate fight as the galaxy descends further into darkness. Pushed to the edges of the galaxy by the Empire, Cal will find himself surrounded by threats new and familiar. As one of the last surviving Jedi Knights, Cal is driven to make a stand during the galaxy’s darkest times — but how far is he willing to go to protect himself, his crew, and the legacy of the Jedi Order? & {[}{]}                                                                                               & 13 & 2  & 367  & 1.4K\\\\\n",
       "\t 1160 & We Love Katamari Reroll + Royal Reverie           & Jun 02, 2023    & {[}'Bandai Namco Entertainment', 'MONKEYCRAFT Co. Ltd'{]}     & NA & 51  & 51  & {[}'Adventure', 'Puzzle'{]}         & We Love Katamari Reroll + Royal Reverie is a remake of the PS2 game We Love Katamari.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         & {[}{]}                                                                                               & 3  & 0  & 74   & 291 \\\\\n",
       "\t 1202 & Earthblade                                        & Dec 31, 2024    & {[}'Extremely OK Games'{]}                                    & NA & 83  & 83  & {[}'Adventure', 'Indie', 'RPG'{]}   & You are Névoa, an enigmatic child of Fate returning at long last to Earth, in this explor-action platformer from the creators of Celeste. Earthblade's lush pixel art world offers seamless exploration, challenging combat, and countless mysteries to pick apart.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           & {[}{]}                                                                                               & 0  & 1  & 103  & 529 \\\\\n",
       "\t 1305 & Diablo IV                                         & Jun 06, 2023    & {[}'Blizzard Entertainment'{]}                                & NA & 148 & 148 & {[}'Brawler', 'RPG'{]}              & Endless demons to slaughter. Deep customization through Talents, Skill Points, Runes, and Legendary loot. Randomized dungeons contained in a dynamic open world. Survive and conquer darkness—or succumb to the shadows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      & {[}{]}                                                                                               & 19 & 10 & 179  & 677 \\\\\n",
       "\t 1341 & Pac-Man in a Tin                                  & Mar 22, 2023    & {[}'Fizz Creations'{]}                                        & NA & 0   & 0   & {[}'Arcade'{]}                      & Pac-Man in a Tin is a pocket-sized tin contains the classic arcade game in all its 8-bit glory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               & {[}{]}                                                                                               & 1  & 0  & 1    & 2   \\\\\n",
       "\t 1349 & Pokémon Añil                                      & Mar 23, 2023    & {[}'Eric Lost'{]}                                             & NA & 2   & 2   & {[}'RPG'{]}                         & Pokémon Añil is the fourth video game created by EricLostie after \"\"Pokémon Opalo\"\". Kanto returns, but this time from a perspective never seen before, with a much deeper story and improved graphics.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       & {[}'pokemon HWHAT', 'Finally, after all these years... Pokémon Anal. Thanks Nintendo, very cool.'{]} & 1  & 0  & 1    & 7   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 13 × 14\n",
       "\n",
       "| V1 &lt;int&gt; | Title &lt;chr&gt; | Release Date &lt;chr&gt; | Team &lt;chr&gt; | Rating &lt;dbl&gt; | Times Listed &lt;chr&gt; | Number of Reviews &lt;chr&gt; | Genres &lt;chr&gt; | Summary &lt;chr&gt; | Reviews &lt;chr&gt; | Plays &lt;chr&gt; | Playing &lt;chr&gt; | Backlogs &lt;chr&gt; | Wishlist &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "|  587 | Final Fantasy XVI                                 | Jun 22, 2023    | ['Square Enix', 'Square Enix Creative Business Unit III'] | NA | 422 | 422 | ['RPG']                         | Final Fantasy XVI is an upcoming action role-playing game developed and published by Square Enix. It is the sixteenth game in the mainline Final Fantasy series and will be released for the PlayStation 5. It is being produced by Naoki Yoshida and directed by Hiroshi Takai.                                                                                                                                                                                                                                                                                                                                                                                                                                                              | []                                                                                               | 37 | 10 | 732  | 2.4K |\n",
       "|  649 | Death Stranding 2                                 | releases on TBD | ['Kojima Productions']                                    | NA | 105 | 105 | ['Adventure', 'Shooter']        | <!----> | []                                                                                               | 3  | 0  | 209  | 644  |\n",
       "|  713 | Final Fantasy VII Rebirth                         | Dec 31, 2023    | ['Square Enix']                                           | NA | 192 | 192 | []                              | This next standalone chapter in the FINAL FANTASY VII remake trilogy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | []                                                                                               | 20 | 3  | 354  | 1.1K |\n",
       "|  719 | Lies of P                                         | Aug 01, 2023    | ['NEOWIZ', 'Round8 Studio']                               | NA | 175 | 175 | ['RPG']                         | Inspired by the familiar story of Pinocchio, Lies of P is an action souls-like game set in a dark Belle Époque world. Guide Pinocchio on his unrelenting journey to become human.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | []                                                                                               | 5  | 0  | 260  | 939  |\n",
       "|  726 | Judas                                             | Mar 31, 2025    | ['Ghost Story Games']                                     | NA | 90  | 90  | ['Adventure', 'Shooter']        | A disintegrating starship. A desperate escape plan. You are the mysterious and troubled Judas. Your only hope for survival is to make or break alliances with your worst enemies. Will you work together to fix what you broke – or will you leave it to burn?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | []                                                                                               | 1  | 0  | 92   | 437  |\n",
       "|  746 | Like a Dragon Gaiden: The Man Who Erased His Name | Dec 31, 2023    | ['Ryū Ga Gotoku Studios', 'Sega']                         | NA | 118 | 118 | ['Adventure', 'Brawler', 'RPG'] | This game covers Kiryu's story between Yakuza 7 and Like a Dragon 8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | []                                                                                               | 2  | 1  | 145  | 588  |\n",
       "|  972 | The Legend of Zelda: Tears of the Kingdom         | May 12, 2023    | ['Nintendo', 'Nintendo EPD Production Group No. 3']       | NA | 581 | 581 | ['Adventure', 'RPG']            | The Legend of Zelda: Tears of the Kingdom is the sequel to The Legend of Zelda: Breath of the Wild. The setting for Link’s adventure has been expanded to include the skies above the vast lands of Hyrule.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | []                                                                                               | 72 | 6  | 1.6K | 5.4K |\n",
       "| 1130 | Star Wars Jedi: Survivor                          | Apr 28, 2023    | ['Respawn Entertainment', 'Electronic Arts']              | NA | 250 | 250 | ['Adventure']                   | The story of Cal Kestis continues in Star Wars Jedi: Survivor, a third-person, galaxy-spanning, action-adventure game from Respawn Entertainment, developed in collaboration with Lucasfilm Games. This narratively driven, single-player title picks up five years after the events of Star Wars Jedi: Fallen Order and follows Cal’s increasingly desperate fight as the galaxy descends further into darkness. Pushed to the edges of the galaxy by the Empire, Cal will find himself surrounded by threats new and familiar. As one of the last surviving Jedi Knights, Cal is driven to make a stand during the galaxy’s darkest times — but how far is he willing to go to protect himself, his crew, and the legacy of the Jedi Order? | []                                                                                               | 13 | 2  | 367  | 1.4K |\n",
       "| 1160 | We Love Katamari Reroll + Royal Reverie           | Jun 02, 2023    | ['Bandai Namco Entertainment', 'MONKEYCRAFT Co. Ltd']     | NA | 51  | 51  | ['Adventure', 'Puzzle']         | We Love Katamari Reroll + Royal Reverie is a remake of the PS2 game We Love Katamari.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | []                                                                                               | 3  | 0  | 74   | 291  |\n",
       "| 1202 | Earthblade                                        | Dec 31, 2024    | ['Extremely OK Games']                                    | NA | 83  | 83  | ['Adventure', 'Indie', 'RPG']   | You are Névoa, an enigmatic child of Fate returning at long last to Earth, in this explor-action platformer from the creators of Celeste. Earthblade's lush pixel art world offers seamless exploration, challenging combat, and countless mysteries to pick apart.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | []                                                                                               | 0  | 1  | 103  | 529  |\n",
       "| 1305 | Diablo IV                                         | Jun 06, 2023    | ['Blizzard Entertainment']                                | NA | 148 | 148 | ['Brawler', 'RPG']              | Endless demons to slaughter. Deep customization through Talents, Skill Points, Runes, and Legendary loot. Randomized dungeons contained in a dynamic open world. Survive and conquer darkness—or succumb to the shadows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | []                                                                                               | 19 | 10 | 179  | 677  |\n",
       "| 1341 | Pac-Man in a Tin                                  | Mar 22, 2023    | ['Fizz Creations']                                        | NA | 0   | 0   | ['Arcade']                      | Pac-Man in a Tin is a pocket-sized tin contains the classic arcade game in all its 8-bit glory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | []                                                                                               | 1  | 0  | 1    | 2    |\n",
       "| 1349 | Pokémon Añil                                      | Mar 23, 2023    | ['Eric Lost']                                             | NA | 2   | 2   | ['RPG']                         | Pokémon Añil is the fourth video game created by EricLostie after \"\"Pokémon Opalo\"\". Kanto returns, but this time from a perspective never seen before, with a much deeper story and improved graphics.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | ['pokemon HWHAT', 'Finally, after all these years... Pokémon Anal. Thanks Nintendo, very cool.'] | 1  | 0  | 1    | 7    |\n",
       "\n"
      ],
      "text/plain": [
       "   V1   Title                                             Release Date   \n",
       "1   587 Final Fantasy XVI                                 Jun 22, 2023   \n",
       "2   649 Death Stranding 2                                 releases on TBD\n",
       "3   713 Final Fantasy VII Rebirth                         Dec 31, 2023   \n",
       "4   719 Lies of P                                         Aug 01, 2023   \n",
       "5   726 Judas                                             Mar 31, 2025   \n",
       "6   746 Like a Dragon Gaiden: The Man Who Erased His Name Dec 31, 2023   \n",
       "7   972 The Legend of Zelda: Tears of the Kingdom         May 12, 2023   \n",
       "8  1130 Star Wars Jedi: Survivor                          Apr 28, 2023   \n",
       "9  1160 We Love Katamari Reroll + Royal Reverie           Jun 02, 2023   \n",
       "10 1202 Earthblade                                        Dec 31, 2024   \n",
       "11 1305 Diablo IV                                         Jun 06, 2023   \n",
       "12 1341 Pac-Man in a Tin                                  Mar 22, 2023   \n",
       "13 1349 Pokémon Añil                                      Mar 23, 2023   \n",
       "   Team                                                      Rating\n",
       "1  ['Square Enix', 'Square Enix Creative Business Unit III'] NA    \n",
       "2  ['Kojima Productions']                                    NA    \n",
       "3  ['Square Enix']                                           NA    \n",
       "4  ['NEOWIZ', 'Round8 Studio']                               NA    \n",
       "5  ['Ghost Story Games']                                     NA    \n",
       "6  ['Ryū Ga Gotoku Studios', 'Sega']                         NA    \n",
       "7  ['Nintendo', 'Nintendo EPD Production Group No. 3']       NA    \n",
       "8  ['Respawn Entertainment', 'Electronic Arts']              NA    \n",
       "9  ['Bandai Namco Entertainment', 'MONKEYCRAFT Co. Ltd']     NA    \n",
       "10 ['Extremely OK Games']                                    NA    \n",
       "11 ['Blizzard Entertainment']                                NA    \n",
       "12 ['Fizz Creations']                                        NA    \n",
       "13 ['Eric Lost']                                             NA    \n",
       "   Times Listed Number of Reviews Genres                         \n",
       "1  422          422               ['RPG']                        \n",
       "2  105          105               ['Adventure', 'Shooter']       \n",
       "3  192          192               []                             \n",
       "4  175          175               ['RPG']                        \n",
       "5  90           90                ['Adventure', 'Shooter']       \n",
       "6  118          118               ['Adventure', 'Brawler', 'RPG']\n",
       "7  581          581               ['Adventure', 'RPG']           \n",
       "8  250          250               ['Adventure']                  \n",
       "9  51           51                ['Adventure', 'Puzzle']        \n",
       "10 83           83                ['Adventure', 'Indie', 'RPG']  \n",
       "11 148          148               ['Brawler', 'RPG']             \n",
       "12 0            0                 ['Arcade']                     \n",
       "13 2            2                 ['RPG']                        \n",
       "   Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \n",
       "1  Final Fantasy XVI is an upcoming action role-playing game developed and published by Square Enix. It is the sixteenth game in the mainline Final Fantasy series and will be released for the PlayStation 5. It is being produced by Naoki Yoshida and directed by Hiroshi Takai.                                                                                                                                                                                                                                                                                                                                                                                                                                                             \n",
       "2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \n",
       "3  This next standalone chapter in the FINAL FANTASY VII remake trilogy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         \n",
       "4  Inspired by the familiar story of Pinocchio, Lies of P is an action souls-like game set in a dark Belle Époque world. Guide Pinocchio on his unrelenting journey to become human.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            \n",
       "5  A disintegrating starship. A desperate escape plan. You are the mysterious and troubled Judas. Your only hope for survival is to make or break alliances with your worst enemies. Will you work together to fix what you broke – or will you leave it to burn?                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \n",
       "6  This game covers Kiryu's story between Yakuza 7 and Like a Dragon 8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         \n",
       "7  The Legend of Zelda: Tears of the Kingdom is the sequel to The Legend of Zelda: Breath of the Wild. The setting for Link’s adventure has been expanded to include the skies above the vast lands of Hyrule.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  \n",
       "8  The story of Cal Kestis continues in Star Wars Jedi: Survivor, a third-person, galaxy-spanning, action-adventure game from Respawn Entertainment, developed in collaboration with Lucasfilm Games. This narratively driven, single-player title picks up five years after the events of Star Wars Jedi: Fallen Order and follows Cal’s increasingly desperate fight as the galaxy descends further into darkness. Pushed to the edges of the galaxy by the Empire, Cal will find himself surrounded by threats new and familiar. As one of the last surviving Jedi Knights, Cal is driven to make a stand during the galaxy’s darkest times — but how far is he willing to go to protect himself, his crew, and the legacy of the Jedi Order?\n",
       "9  We Love Katamari Reroll + Royal Reverie is a remake of the PS2 game We Love Katamari.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        \n",
       "10 You are Névoa, an enigmatic child of Fate returning at long last to Earth, in this explor-action platformer from the creators of Celeste. Earthblade's lush pixel art world offers seamless exploration, challenging combat, and countless mysteries to pick apart.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          \n",
       "11 Endless demons to slaughter. Deep customization through Talents, Skill Points, Runes, and Legendary loot. Randomized dungeons contained in a dynamic open world. Survive and conquer darkness—or succumb to the shadows.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     \n",
       "12 Pac-Man in a Tin is a pocket-sized tin contains the classic arcade game in all its 8-bit glory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              \n",
       "13 Pokémon Añil is the fourth video game created by EricLostie after \"\"Pokémon Opalo\"\". Kanto returns, but this time from a perspective never seen before, with a much deeper story and improved graphics.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \n",
       "   Reviews                                                                                         \n",
       "1  []                                                                                              \n",
       "2  []                                                                                              \n",
       "3  []                                                                                              \n",
       "4  []                                                                                              \n",
       "5  []                                                                                              \n",
       "6  []                                                                                              \n",
       "7  []                                                                                              \n",
       "8  []                                                                                              \n",
       "9  []                                                                                              \n",
       "10 []                                                                                              \n",
       "11 []                                                                                              \n",
       "12 []                                                                                              \n",
       "13 ['pokemon HWHAT', 'Finally, after all these years... Pokémon Anal. Thanks Nintendo, very cool.']\n",
       "   Plays Playing Backlogs Wishlist\n",
       "1  37    10      732      2.4K    \n",
       "2  3     0       209      644     \n",
       "3  20    3       354      1.1K    \n",
       "4  5     0       260      939     \n",
       "5  1     0       92       437     \n",
       "6  2     1       145      588     \n",
       "7  72    6       1.6K     5.4K    \n",
       "8  13    2       367      1.4K    \n",
       "9  3     0       74       291     \n",
       "10 0     1       103      529     \n",
       "11 19    10      179      677     \n",
       "12 1     0       1        2       \n",
       "13 1     0       1        7       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "missing<-games%>%          #let check the rows which have null values in it \n",
    "filter(!complete.cases(.))\n",
    "View(missing)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "515c2226",
   "metadata": {
    "papermill": {
     "duration": 0.014128,
     "end_time": "2024-05-25T08:32:30.352584",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.338456",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Removing Unnecessary columns\n",
    "We will remove the 'Summary' and 'Reviews' columns from the DataFrame using the subset()."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "764a31fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.384743Z",
     "iopub.status.busy": "2024-05-25T08:32:30.383055Z",
     "iopub.status.idle": "2024-05-25T08:32:30.398336Z",
     "shell.execute_reply": "2024-05-25T08:32:30.396530Z"
    },
    "papermill": {
     "duration": 0.033889,
     "end_time": "2024-05-25T08:32:30.400804",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.366915",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "games_cleaned <- subset(games_cleaned, select = -c(Summary, Reviews))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "96ee9c3d",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.432991Z",
     "iopub.status.busy": "2024-05-25T08:32:30.431315Z",
     "iopub.status.idle": "2024-05-25T08:32:30.456748Z",
     "shell.execute_reply": "2024-05-25T08:32:30.454684Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.044262,
     "end_time": "2024-05-25T08:32:30.459185",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.414923",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,499\n",
      "Columns: 12\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Bandai Namco Entertainment', 'FromSoftware']\", …\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.9K\", \"2.9K\", \"4.3K\", \"3.5K\", \"3K\", \"2.3K\", \"1.6…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Adventure', 'RPG']\", \"['Adventure', 'Brawler', …\n",
      "$ Plays               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"17K\", \"21K\", \"30K\", \"28K\", \"21K\", \"33K\", \"7.2K\", …\n",
      "$ Playing             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"3.8K\", \"3.2K\", \"2.5K\", \"679\", \"2.4K\", \"1.8K\", \"1.…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.6K\", \"6.3K\", \"5K\", \"4.9K\", \"8.3K\", \"1.1K\", \"4.5…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4.8K\", \"3.6K\", \"2.6K\", \"1.8K\", \"2.3K\", \"230\", \"3.…\n"
     ]
    }
   ],
   "source": [
    "glimpse(games_cleaned)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2a45bbc4",
   "metadata": {
    "papermill": {
     "duration": 0.014165,
     "end_time": "2024-05-25T08:32:30.487644",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.473479",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Converting 'nk' format to numerical\n",
    "If we observe \"Playing\", \"Plays\", \"Backlogs\", \"Wishlist\", \"Times Listed\", \"Number of Reviews\" columns, we could see that these columns values are in 'nK' format which represents that values are in thousands and also these columns are in 'string' data type.\n",
    "Now, then we will covert the 'nk' format numerical and change it's data type to 'double'."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "553a886e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.519822Z",
     "iopub.status.busy": "2024-05-25T08:32:30.518117Z",
     "iopub.status.idle": "2024-05-25T08:32:30.533882Z",
     "shell.execute_reply": "2024-05-25T08:32:30.532056Z"
    },
    "papermill": {
     "duration": 0.034684,
     "end_time": "2024-05-25T08:32:30.536436",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.501752",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#function to convert 'nk' format. \n",
    "convert_k <- function(x){ if(grepl(\"k$\",x,ignore.case = TRUE)) #finding 'nk' format values\n",
    "{ as.double(sub(\"k\",\"\",x,ignore.case = TRUE))*1000} #substituting  'k' with 1000\n",
    "else{ as.double(x)}} #converting rest to double\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "817d7438",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.609896Z",
     "iopub.status.busy": "2024-05-25T08:32:30.608237Z",
     "iopub.status.idle": "2024-05-25T08:32:30.671984Z",
     "shell.execute_reply": "2024-05-25T08:32:30.669739Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.082522,
     "end_time": "2024-05-25T08:32:30.674644",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.592122",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n",
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n",
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n",
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n",
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n",
      "Warning message in if (grepl(\"k$\", x, ignore.case = TRUE)) {:\n",
      "“the condition has length > 1 and only the first element will be used”\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,499\n",
      "Columns: 12\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Bandai Namco Entertainment', 'FromSoftware']\", …\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3900, 2900, 4300, 3500, 3000, 2300, 1600, 2100, 86…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3900, 2900, 4300, 3500, 3000, 2300, 1600, 2100, 86…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"['Adventure', 'RPG']\", \"['Adventure', 'Brawler', …\n",
      "$ Plays               \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 17000, 21000, 30000, 28000, 21000, 33000, 7200, 92…\n",
      "$ Playing             \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3800, 3200, 2500, 679000, 2400, 1800, 1100, 759000…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4600, 6300, 5000, 4900, 8300, 1100, 4500, 3400, 77…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4800, 3600, 2600, 1800, 2300, 230000, 3800, 3300, …\n"
     ]
    }
   ],
   "source": [
    "columns_to_convert<- c(\"Playing\", \"Plays\", \"Backlogs\", \"Wishlist\", \"Times Listed\", \"Number of Reviews\")\n",
    "games_cleaned[columns_to_convert] <- lapply(games_cleaned[columns_to_convert], convert_k)\n",
    "glimpse(games_cleaned)#applying the function to each column"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2a091332",
   "metadata": {
    "papermill": {
     "duration": 0.014568,
     "end_time": "2024-05-25T08:32:30.703939",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.689371",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Removing slashes, brackets and unnecessary spaces\n",
    "Now all 'nk' format values are converted to numerical but if observe 'Team' and 'Genres' columns there are lots of brackets, slashes and unnecessary spaces so, lets remove those."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e4b796a1",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.737427Z",
     "iopub.status.busy": "2024-05-25T08:32:30.735764Z",
     "iopub.status.idle": "2024-05-25T08:32:30.792744Z",
     "shell.execute_reply": "2024-05-25T08:32:30.790676Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.076648,
     "end_time": "2024-05-25T08:32:30.795135",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.718487",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 1,499\n",
      "Columns: 12\n",
      "$ V1                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, …\n",
      "$ Title               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Elden Ring\", \"Hades\", \"The Legend of Zelda: Breat…\n",
      "$ `Release Date`      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Feb 25, 2022\", \"Dec 10, 2019\", \"Mar 03, 2017\", \"S…\n",
      "$ Team                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"BandaiNamcoEntertainment,FromSoftware\", \"Supergia…\n",
      "$ Rating              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.5, 4.3, 4.4, 4.2, 4.4, 4.3, 4.2, 4.3, 3.0, 4.3, …\n",
      "$ `Times Listed`      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3900, 2900, 4300, 3500, 3000, 2300, 1600, 2100, 86…\n",
      "$ `Number of Reviews` \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3900, 2900, 4300, 3500, 3000, 2300, 1600, 2100, 86…\n",
      "$ Genres              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Adventure,RPG\", \"Adventure,Brawler,Indie,RPG\", \"A…\n",
      "$ Plays               \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 17000, 21000, 30000, 28000, 21000, 33000, 7200, 92…\n",
      "$ Playing             \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3800, 3200, 2500, 679000, 2400, 1800, 1100, 759000…\n",
      "$ Backlogs            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4600, 6300, 5000, 4900, 8300, 1100, 4500, 3400, 77…\n",
      "$ Wishlist            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4800, 3600, 2600, 1800, 2300, 230000, 3800, 3300, …\n"
     ]
    }
   ],
   "source": [
    "games_cleaned <- games_cleaned%>%\n",
    "mutate(Genres = gsub(\"\\\\[|\\\\]|'\", \"\", Genres))%>% #substituting brackets and slashes' pattern \n",
    "mutate(Team = gsub(\"\\\\[|\\\\]|'\", \"\", Team))%>%\n",
    "mutate(Genres= gsub(\"\\\\s+\",\"\",Genres))%>% #substituting unnecessary spaces \n",
    "mutate(Team=gsub(\"\\\\s+\",\"\",Team))\n",
    "glimpse(games_cleaned)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e8336035",
   "metadata": {
    "papermill": {
     "duration": 0.014785,
     "end_time": "2024-05-25T08:32:30.824589",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.809804",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Converting 'Release Date' to datetime format\n",
    "'Release Date' column is also in 'string' datatype we will convert it to datetime format."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "6085578e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.858114Z",
     "iopub.status.busy": "2024-05-25T08:32:30.856436Z",
     "iopub.status.idle": "2024-05-25T08:32:30.891502Z",
     "shell.execute_reply": "2024-05-25T08:32:30.889531Z"
    },
    "papermill": {
     "duration": 0.055007,
     "end_time": "2024-05-25T08:32:30.894472",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.839465",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“ 2 failed to parse.”\n"
     ]
    }
   ],
   "source": [
    "games_cleaned$`Release Date`<- mdy(games_cleaned$`Release Date`) #converting release Date to mdy format"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "3425779b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:30.928047Z",
     "iopub.status.busy": "2024-05-25T08:32:30.926441Z",
     "iopub.status.idle": "2024-05-25T08:32:30.964840Z",
     "shell.execute_reply": "2024-05-25T08:32:30.962984Z"
    },
    "papermill": {
     "duration": 0.058912,
     "end_time": "2024-05-25T08:32:30.968235",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.909323",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write.csv( games_cleaned,file=\"games_cleaned.csv\", row.names=FALSE) #exporting clean data as csv "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e0fe2363",
   "metadata": {
    "papermill": {
     "duration": 0.014802,
     "end_time": "2024-05-25T08:32:30.998019",
     "exception": false,
     "start_time": "2024-05-25T08:32:30.983217",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Genre and team analysis \n",
    "We perform analysis on the genres and teams associated with the games.\n",
    "To analysis 'Genre' and 'Team' column we need to remove commas first so that we could easily know there occuring count."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "500f6d70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.031074Z",
     "iopub.status.busy": "2024-05-25T08:32:31.029458Z",
     "iopub.status.idle": "2024-05-25T08:32:31.122475Z",
     "shell.execute_reply": "2024-05-25T08:32:31.120639Z"
    },
    "papermill": {
     "duration": 0.11303,
     "end_time": "2024-05-25T08:32:31.125711",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.012681",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "games_cleaned1<- games_cleaned %>% #removing commas from \"Genres\"\n",
    "separate_rows(Genres, sep = \",\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "fc0ab940",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.158675Z",
     "iopub.status.busy": "2024-05-25T08:32:31.157040Z",
     "iopub.status.idle": "2024-05-25T08:32:31.204757Z",
     "shell.execute_reply": "2024-05-25T08:32:31.202953Z"
    },
    "papermill": {
     "duration": 0.067586,
     "end_time": "2024-05-25T08:32:31.207887",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.140301",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "games_cleaned2<- games_cleaned %>% #removing commas from \"team\"\n",
    " separate_rows(Team, sep = \",\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "3f73e631",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.240572Z",
     "iopub.status.busy": "2024-05-25T08:32:31.238931Z",
     "iopub.status.idle": "2024-05-25T08:32:31.286733Z",
     "shell.execute_reply": "2024-05-25T08:32:31.284891Z"
    },
    "papermill": {
     "duration": 0.066823,
     "end_time": "2024-05-25T08:32:31.289204",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.222381",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\n",
       "|Genres            |    n|\n",
       "|:-----------------|----:|\n",
       "|Adventure         | 1007|\n",
       "|RPG               |  516|\n",
       "|Shooter           |  351|\n",
       "|Platform          |  329|\n",
       "|Indie             |  283|\n",
       "|Puzzle            |  175|\n",
       "|Brawler           |  157|\n",
       "|Strategy          |  142|\n",
       "|Simulator         |  125|\n",
       "|TurnBasedStrategy |   99|\n",
       "|Arcade            |   72|\n",
       "|Fighting          |   72|\n",
       "|VisualNovel       |   71|\n",
       "|Tactical          |   50|\n",
       "|Point-and-Click   |   46|\n",
       "|Racing            |   42|\n",
       "|Music             |   25|\n",
       "|Sport             |   25|\n",
       "|Card&BoardGame    |   16|\n",
       "|RealTimeStrategy  |   10|\n",
       "|Quiz/Trivia       |    4|\n",
       "|MOBA              |    3|\n",
       "|                  |    2|\n",
       "|Pinball           |    1|"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "genre_counts <- games_cleaned1 %>% #retrieving total counts of games according to their Genre\n",
    "  count(Genres, sort= TRUE)\n",
    "kable(genre_counts)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "40630641",
   "metadata": {
    "papermill": {
     "duration": 0.014788,
     "end_time": "2024-05-25T08:32:31.319018",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.304230",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Imgur](https://i.imgur.com/yvC18Ee.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6d7f0e96",
   "metadata": {
    "papermill": {
     "duration": 0.014744,
     "end_time": "2024-05-25T08:32:31.348690",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.333946",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We could clearly observe from above graph that the most dominating genre is **Adventure** holds 27.81% of total genres which is nearly double the second most prominent genre **RPG**(holds 14.25%). It is important to note that many of the games have more than one genre. For example **Elden Ring** have both adventure and RPG as genres and **hades** have **four genres**(Adventure,Brawler,Indie,RPG)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "416c6437",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.382179Z",
     "iopub.status.busy": "2024-05-25T08:32:31.380604Z",
     "iopub.status.idle": "2024-05-25T08:32:31.435288Z",
     "shell.execute_reply": "2024-05-25T08:32:31.433521Z"
    },
    "papermill": {
     "duration": 0.074185,
     "end_time": "2024-05-25T08:32:31.437656",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.363471",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Team</th><th scope=col>count</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Nintendo                 </td><td>244</td></tr>\n",
       "\t<tr><td>Capcom                   </td><td> 89</td></tr>\n",
       "\t<tr><td>SquareEnix               </td><td> 77</td></tr>\n",
       "\t<tr><td>Sega                     </td><td> 63</td></tr>\n",
       "\t<tr><td>ElectronicArts           </td><td> 58</td></tr>\n",
       "\t<tr><td>SonyComputerEntertainment</td><td> 44</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Team & count\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Nintendo                  & 244\\\\\n",
       "\t Capcom                    &  89\\\\\n",
       "\t SquareEnix                &  77\\\\\n",
       "\t Sega                      &  63\\\\\n",
       "\t ElectronicArts            &  58\\\\\n",
       "\t SonyComputerEntertainment &  44\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 2\n",
       "\n",
       "| Team &lt;chr&gt; | count &lt;int&gt; |\n",
       "|---|---|\n",
       "| Nintendo                  | 244 |\n",
       "| Capcom                    |  89 |\n",
       "| SquareEnix                |  77 |\n",
       "| Sega                      |  63 |\n",
       "| ElectronicArts            |  58 |\n",
       "| SonyComputerEntertainment |  44 |\n",
       "\n"
      ],
      "text/plain": [
       "  Team                      count\n",
       "1 Nintendo                  244  \n",
       "2 Capcom                     89  \n",
       "3 SquareEnix                 77  \n",
       "4 Sega                       63  \n",
       "5 ElectronicArts             58  \n",
       "6 SonyComputerEntertainment  44  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "team_counts <- games_cleaned2 %>%#retrieving total counts of games each team have\n",
    "group_by(Team)%>%\n",
    "summarise(count=n())%>%\n",
    "arrange(desc(count))\n",
    "head(team_counts)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fc45ba39",
   "metadata": {
    "papermill": {
     "duration": 0.015055,
     "end_time": "2024-05-25T08:32:31.467773",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.452718",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Imgur](https://i.imgur.com/3HmO3k6.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7ef2efa2",
   "metadata": {
    "papermill": {
     "duration": 0.014921,
     "end_time": "2024-05-25T08:32:31.497668",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.482747",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "When we talk about teams, Nintendo stands out in the first place, representing 22.10% of the total games, followed by Capcom (8.06%) and Square Enix (6.97%)."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bf55ba42",
   "metadata": {
    "papermill": {
     "duration": 0.014806,
     "end_time": "2024-05-25T08:32:31.527424",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.512618",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Most Played games in each Genre\n",
    "We already know which team has most of games and which genre is most prominent. Now, let's explore the most played game in each genre."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "ef713802",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.560844Z",
     "iopub.status.busy": "2024-05-25T08:32:31.559193Z",
     "iopub.status.idle": "2024-05-25T08:32:31.654451Z",
     "shell.execute_reply": "2024-05-25T08:32:31.652162Z"
    },
    "papermill": {
     "duration": 0.114593,
     "end_time": "2024-05-25T08:32:31.656976",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.542383",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'Genres'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\n",
       "|Genres            |Title                                    |  Plays|\n",
       "|:-----------------|:----------------------------------------|------:|\n",
       "|Adventure         |Ninja Gaiden Black                       | 992000|\n",
       "|Brawler           |Ninja Gaiden Black                       | 992000|\n",
       "|RPG               |Alpha Protocol                           | 987000|\n",
       "|Shooter           |Alpha Protocol                           | 987000|\n",
       "|Fighting          |Twisted Metal                            | 986000|\n",
       "|Racing            |Twisted Metal                            | 986000|\n",
       "|Indie             |Chicory: A Colorful Tale                 | 984000|\n",
       "|Puzzle            |Chicory: A Colorful Tale                 | 984000|\n",
       "|VisualNovel       |Wonderful Everyday: Down the Rabbit-Hole | 982000|\n",
       "|Platform          |Mega Man ZX Advent                       | 976000|\n",
       "|                  |Peggle Deluxe                            | 939000|\n",
       "|Sport             |Mario Strikers: Battle League            | 932000|\n",
       "|Arcade            |Mighty No. 9                             | 907000|\n",
       "|Point-and-Click   |World of Horror                          | 871000|\n",
       "|TurnBasedStrategy |World of Horror                          | 871000|\n",
       "|Strategy          |Fire Emblem: New Mystery of the Emblem   | 848000|\n",
       "|Card&BoardGame    |Marvel Snap                              | 847000|\n",
       "|Tactical          |Fire Emblem: Thracia 776                 | 820000|\n",
       "|Music             |Rez Infinite                             | 713000|\n",
       "|Simulator         |Telling Lies                             | 646000|\n",
       "|RealTimeStrategy  |Plants vs. Zombies                       |  14000|\n",
       "|MOBA              |League of Legends                        |  13000|\n",
       "|Quiz/Trivia       |Wordle                                   |   3000|\n",
       "|Pinball           |Pokémon Pinball: Ruby & Sapphire         |   1600|"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "result2 <- games_cleaned1 %>%\n",
    "  select(Title, Genres, Plays) %>%\n",
    "  group_by(Genres, Title) %>%\n",
    "  summarize(Plays = max(Plays)) %>%\n",
    "  group_by(Genres) %>%\n",
    "  filter(Plays == max(Plays))%>%\n",
    "  arrange(desc(Plays))\n",
    "kable(result2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bbc5b5ad",
   "metadata": {
    "papermill": {
     "duration": 0.015518,
     "end_time": "2024-05-25T08:32:31.688824",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.673306",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As you may have noticed, the repetition of game titles occurs because many games belong to more than one genre."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b04ec588",
   "metadata": {
    "papermill": {
     "duration": 0.015218,
     "end_time": "2024-05-25T08:32:31.719197",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.703979",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ##### Games Released each Year\n",
    "Now, we are going to find out how many games were released each year."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "25ae5ced",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T08:32:31.753133Z",
     "iopub.status.busy": "2024-05-25T08:32:31.751491Z",
     "iopub.status.idle": "2024-05-25T08:32:32.334091Z",
     "shell.execute_reply": "2024-05-25T08:32:32.330814Z"
    },
    "papermill": {
     "duration": 0.603681,
     "end_time": "2024-05-25T08:32:32.337867",
     "exception": false,
     "start_time": "2024-05-25T08:32:31.734186",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mRemoved 1 row containing missing values (`geom_line()`).”\n",
      "Warning message:\n",
      "“\u001b[1m\u001b[22mRemoved 1 rows containing missing values (`geom_point()`).”\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "result <- games_cleaned %>%\n",
    "  group_by(year= year(`Release Date`)) %>%\n",
    "  summarize(count=n())\n",
    "ggplot(result, aes(x = year , y = count)) +\n",
    "geom_line(colour = \"blue\")+\n",
    "geom_point(colour= \"blue\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0bccc8ef",
   "metadata": {
    "papermill": {
     "duration": 0.017254,
     "end_time": "2024-05-25T08:32:32.373667",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.356413",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can observe that there is a drastic increase in game releases after the year **2020**. This may be because of the **COVID-19 pandemic**, as people were spending more time at home, so the demand for games was high during that time. In fact, one of the most famous FPS games, Valorant, was also released during the pandemic, and I myself spent a lot of time playing it during lockdown."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f480ff7",
   "metadata": {
    "papermill": {
     "duration": 0.017806,
     "end_time": "2024-05-25T08:32:32.409250",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.391444",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Imgur](https://i.imgur.com/kpKXMqN.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "84170bae",
   "metadata": {
    "papermill": {
     "duration": 0.017702,
     "end_time": "2024-05-25T08:32:32.444722",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.427020",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Next, let's explore the most played games. As we observed above As observed earlier, **Ninja Gaiden Black** is the most played game, followed by **Alpha Protocol**, **Twisted Metal**, and **Chicory: A Colorful Tale**.\n",
    "An interesting fact about **Ninja Gaiden Black** is that it sold 362,441 copies in North America within its first month of release. However,Japanese sales were less impressive."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f647f4d2",
   "metadata": {
    "papermill": {
     "duration": 0.01793,
     "end_time": "2024-05-25T08:32:32.481253",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.463323",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Imgur](https://i.imgur.com/lH3JAWD.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cd7bc5d8",
   "metadata": {
    "papermill": {
     "duration": 0.017864,
     "end_time": "2024-05-25T08:32:32.516789",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.498925",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "And if talk about the most actively engaged games, we have **It Takes Two** on top, which is  also awarded as game of the Year in 2021, followed by **Kirby And the Forgotten Land**, **Vampire Survivors** and **Death Stranding**."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "341bf7b9",
   "metadata": {
    "papermill": {
     "duration": 0.017728,
     "end_time": "2024-05-25T08:32:32.552116",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.534388",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Imgur](https://i.imgur.com/NxQ2lXx.png)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "78a89c6d",
   "metadata": {
    "papermill": {
     "duration": 0.017714,
     "end_time": "2024-05-25T08:32:32.587714",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.570000",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "So,Here we have Rating vs Plays scatterpoint graph. In this graph we can easily conclude that the top-right games would the best games as those games are most played and have good rating. And we observed that the top five games which are most played with high rating are **Ninja Gaiden Black**,**Chircory:A Colourfull Tails**,**Wonderfull Everyday:Down The Rabbit Hole**,**Mega Man ZX Advent** and **Twisted Metal**."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "05978a51",
   "metadata": {
    "papermill": {
     "duration": 0.0178,
     "end_time": "2024-05-25T08:32:32.623213",
     "exception": false,
     "start_time": "2024-05-25T08:32:32.605413",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Summary**\n",
    "In our analysis of the video game dataset, several key observations emerge:\n",
    "\n",
    "**Genre Dominance**: Adventure emerges as the most dominant genre, representing 27.81% of total genres, followed by RPG at 14.25%. Notably, many games feature multiple genres, exemplified by titles like Elden Ring and Hades.\n",
    "\n",
    "**Top Game Developers**: Nintendo leads the pack in terms of game development, with a significant share of 22.10% of total games, followed by Capcom (8.06%) and Square Enix (6.97%).\n",
    "\n",
    "**Post-2020 Surge in Releases**: There's a noticeable spike in game releases post-2020, likely influenced by the COVID-19 pandemic and increased demand for home entertainment. For example, the release of the acclaimed FPS game, Valorant, during the pandemic underscores this trend.\n",
    "\n",
    "**Most Played Games**: Ninja Gaiden Black emerges as the most played game, followed by Alpha Protocol, Twisted Metal, and Chicory: A Colorful Tale. Notably, Ninja Gaiden Black achieved impressive sales figures in North America within its first month of release.\n",
    "\n",
    "**Active Engagement**: It Takes Two leads the pack as the most actively engaged game, earning the title of Game of the Year in 2021. Other highly engaged titles include Kirby And the Forgotten Land, Vampire Survivors, and Death Stranding.\n",
    "\n",
    "**Most Popular Games**: Our analysis reveals that certain games achieve both high ratings and high play counts. The top five games in this category are Ninja Gaiden Black, Chicory: A Colorful Tale, Wonderful Everyday: Down The Rabbit Hole, Mega Man ZX Advent, and Twisted Metal."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 3038295,
     "sourceId": 5222135,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30530,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 8.966969,
   "end_time": "2024-05-25T08:32:32.766591",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-05-25T08:32:23.799622",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
