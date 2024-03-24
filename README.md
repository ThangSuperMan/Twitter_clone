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

> Notes: currently the bottom navigation bar in the posts screen, we should refactor to place it to the main layout instead of hardcoded in the posts screen but for now we will keep it simple.
