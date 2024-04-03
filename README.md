# Social media application

## Table of contents

- How to push your new feature to this repo?
- Folder structure

## How to push your new feature to this repo?

- Step 1: Clone project to your local machine

```bash
git clone https://github.com/ThangSuperMan/Twitter_clone
```

- Step 2: Checkout from the main branch with format: `feature/chat-page` (feature is require prefix and chat-page means the feature you are developing)
  , for example: you are developing a chat screen and the branch you should create should be `feature/chat-page`

```bash
git checkout -b feature/chat-page
```

- Step 3: Complete your task and push to the remote repo

```bash
git push origin feature/chat-page
```

## Folder structure

- lib/widgets: store all your custom widgets, such as: Button, Calendar,...
- lib/screens: store your screens
- lib/models: store all you models such as: message, user,...
- lib/widgets: store all the common widgets, when you see that the widget using more than two times, it means that it time to make it becomes common
- lib/utils/colors.dart: store all global colors, make sure that you will using this one because it will help us very easy to change the color all places that using the variable color that we defined
- lib/screens/<screen_name>/widgets: <screen_name> is the name of the screen and we should create the widgets folder inside this folder if we see that the widget is so big and this one just only using for a specific screen => it time to make place it inside /lib/screens/<screen_name>/widgets folder

> Notes: currently the bottom navigation bar in the posts screen, we should refactor to place it to the main layout instead of hardcoded in the posts screen but for now we will keep it simple.
