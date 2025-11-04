# Flutter Reversing Suite

## Purpose

This tool was made mainly for handling Flutter reverse engineering, allowing an approximate translation of dart assembly to its Flutter counterpart, leveraging AI models.

**At the moment only supports gemini-cli.**

Regardless of being made targetting dart assembly code, it can be used for anything, acting as an AI file processing wrapper.

## Main (implemented) functionalities

- Multiple workers (parallel)
- Multiple file selection
- Prompt change
- Paths change
- APK processing (blutter requires lib folder, in memory extracted)

## Dependencies

- This tool requires and will clone Blutter into a folder named "blutter" (within this repo's cloning location), for Flutter's APK decompilation.
  - <u>**Please ensure dependencies are met:**</u> https://github.com/worawit/blutter

```bash
# clone repo
git clone https://github.com/luisrodrigues154/frs

cd frs

# install npm packages
npm install adm-zip @google/gemini-cli electron
```

## How to use

- After gemini-cli is installed, please set the credentials (either via web login or via API key).
  - <u>**Refer to:**</u> https://github.com/google-gemini/gemini-cli

```bash
# after installing dependencies and doing authentication (within repo folder)

npm start
```

## Known bugs

- **[notice]** UI was made almost entirely vibe coding, has some bugs and quirks, but overall works good enough for a non-commercial app.
- **[bug]** At the moment, no critical bugs found during use

## TODOS (by order of importance, maybe)

- Implement plugin detector
- Implement filtering
- Improve search
- Make the workers take pending tasks from other workers (currently: pre-start distribution)
- Implement file hiding
- Implement other models
- Implement API key use (the gemini-cli allows for API key variant, not sure on other models. Might be removable)
- Add other prompt templates
- Potentially improve UI and its logic (UI almost 100% vibecoded, so not bulletproof)
- Refactor some parts
