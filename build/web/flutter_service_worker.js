'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a165d2ac50f6ffb3578ffe2be9dd7aff",
"assets/AssetManifest.bin.json": "9294895221fda1d3783e2fb7402fa05e",
"assets/AssetManifest.json": "cd8bc3c81894abef9edee85d171ac7f4",
"assets/assets/dark-images/apple-dark.png": "4c3af959662fa9841a9c84aca462b21e",
"assets/assets/dark-images/boy-dark.png": "f66ca14093e558fa6eed8ba7f7d9fb51",
"assets/assets/dark-images/camel-dark.png": "f842e88c0bfd70c27e7ebc3b4871e9fb",
"assets/assets/dark-images/car-dark.png": "8c4e4b22c0dc9ca22002b70ad5991c4b",
"assets/assets/dark-images/cow-dark.png": "878a437ae2e486b890f06e8ed6d61233",
"assets/assets/dark-images/family-dark.png": "341e6a559016ed9a73827c65853f7455",
"assets/assets/dark-images/girl-dark.png": "eb73298213a0d305e1360adb633c603c",
"assets/assets/dark-images/horse-dark.png": "b78b8876ff121245c6370898c1555c51",
"assets/assets/dark-images/motorcycle-dark.png": "b9bc4db9376ecdfafbc24a39c9c6ba71",
"assets/assets/dark-images/orange-dark.png": "09c91ee901c70bbe29423b77a899b955",
"assets/assets/dark-images/plane-dark.png": "c00b2b38616c091b953349dd4dbd304a",
"assets/assets/dark-images/watermelon-dark.png": "5af53b20d569e403a15b44e18c7cb380",
"assets/assets/images/app-icon.png": "e7175e926626c4e573efa1f6edaa2e17",
"assets/assets/images/apple.png": "fa6e9da4244eb505ad699d37c77f1cfd",
"assets/assets/images/background.jpg": "ceb67a2205ebf6f6278ae60f15f8872a",
"assets/assets/images/boy.png": "80e0bbd6bdca699790de556aa0e3a7f8",
"assets/assets/images/camel.png": "c499ca75b29df1eb5cb7fd35aef5ce22",
"assets/assets/images/car.png": "be92200cae11bb9a61ebae006a48e54b",
"assets/assets/images/cow.png": "7703d7d9ba2d741ccc23b0b28dcc805a",
"assets/assets/images/dataStatisticsBackground.jpg": "b129b6624ade014e254b4203bde198ee",
"assets/assets/images/family.png": "76e560126a0c22a589f856a5746fe54d",
"assets/assets/images/girl.png": "941001ddf4acd185c9e3aa1be962a943",
"assets/assets/images/horse.png": "628f833c3e641b55bf8aac31bc1da091",
"assets/assets/images/motorcycle.png": "50893ea2481ceef0fe70073bea9db970",
"assets/assets/images/orange.png": "e3d4cac11132a2cd4d30ac6a4d3e5e06",
"assets/assets/images/plane.png": "59271e830de57ba38677fe3e4ebf6137",
"assets/assets/images/watermelon.png": "6595960462350a2de5f587d18b0ad9c1",
"assets/assets/jsons/main.json": "85d165c5248f7f5140bdf6ca90dde83f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "51d7e4b4d151f52649edfc4cdb76255a",
"assets/NOTICES": "ffd6c893d966459ec45e349c6434b252",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "020384f507c22da7b2d75e772a4238ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e319602b330848de44ba3f3d6baa2a94",
"/": "e319602b330848de44ba3f3d6baa2a94",
"main.dart.js": "439a342179795294be79f050888bb84e",
"manifest.json": "aac41dcf6d6b5664d00b55a678e9f8fb",
"version.json": "b7f1a9e7e8e9bccfc26be158e59b2923"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
