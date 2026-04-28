{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    // Customize your initialization (e.g., set the renderer)
    const appRunner = await engineInitializer.initializeEngine({
      renderer: "canvaskit", // Options: "canvaskit" or "html"
    });

    console.log("Web application ready!");
    await appRunner.runApp();
  }
});
