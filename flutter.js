_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine({
      renderer: "canvaskit", // Essential for 3D/Web4 graphics
      useColorEmoji: true,
    });
    await appRunner.runApp();
  }
});
