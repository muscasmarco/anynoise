# anynoise 

A simple GUI app for playing white noise.

# Building 

For now I'm running both the Qt6 libraries installed and made available by my OS and
the ones downloaded from the Qt6 provided tool for tools management (Qt Management Tool).

The build command, at least for me is: 

```bash
cd build/
cmake -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64 -DQt6_DIR=~/Qt/6.9.3/gcc_64/lib/cmake/ ..
```

## Did VSCode's Intellisense break?

Reconfigure the CMake kit: 

```
Ctrl+Shift+P → CMake: Select Kit
```

Then point it to the `/home/${USER}/Qt6/...` local path.