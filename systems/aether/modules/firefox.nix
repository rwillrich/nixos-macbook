{ lib, ... }: {
  environment.sessionVariables.MOZ_USE_XINPUT2 = "1";

  programs.firefox = {
    enable = true;

    policies = {
      AIControls.Default = {
        Value = "blocked";
        Locked = true;
      };

      AllowedDomainsForApps = "";

      AutofillAddressEnabled = false;

      AutofillCreditCardEnabled = false;

      BrowserDataBackup = false;

      CNSA2KeyAgreementEnabled = true;

      ContentAnalysis.Enabled = false;

      Cookies = {
        Behavior = "reject-foreign";
        BehaviorPrivateBrowsing = "reject-foreign";
        Locked = true;
      };

      DefaultBrowserSettingEnabled = false;

      DisableAccounts = true;

      DisableAppUpdate = true;

      DisableFirefoxStudies = true;

      DisableLaunchOnLogin = true;

      DisableMasterPasswordCreation = true;

      DisableProfileImport = true;

      DisableProfileRefresh = true;

      DisableSetDesktopBackground = true;

      DisableSystemAddonUpdate = true;

      DisableTelemetry = true;

      DisplayBookmarksToolbar = "newtab";

      DisplayMenuBar = "default-off";

      DNSOverHTTPS = {
        Enabled = false;
        Locked = true;
      };

      EnableTrackingProtection = {
        Category = "strict";
        BaselineExceptions = true;
        ConvenienceExceptions = false;
        Exceptions = [ ];
      };

      EncryptedMediaExtensions = {
        Enabled = false;
        Locked = true;
      };

      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
          blocked_install_message = "Installing addons is forbidden by the NixOS system configuration.";
          updates_disabled = true;
        };

        "langpack-en-US@firefox.mozilla.org" = {
          installation_mode = "force_installed";
        };

        "langpack-pt-BR@firefox.mozilla.org" = {
          installation_mode = "force_installed";
        };

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # 1Password
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
      };

      ExtensionUpdate = false;

      FirefoxHome = {
        Search = true;
        Weather = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Stories = false;
        SponsoredStories = false;
        Widgets = {
          Enabled = true;
          Blocked = [ ];
        };
        Locked = true;
      };

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        OnlineEnabled = false;
        Locked = true;
      };

      Homepage = {
        StartPage = "previous-session";
        NewTabOnRestore = false;
        Locked = true;
      };

      HttpsOnlyMode = "force_enabled";

      InstallAddonsPermission = {
        Allow = [ ];
        Default = false;
      };

      LegacySameSiteCookieBehaviorEnabled = false;

      LegacySameSiteCookieBehaviorEnabledForDomainList = [ ];

      LocalFileLinks = [ ];

      LocalNetworkAccess = {
        Enabled = true;
        BlockTrackers = true;
        EnablePrompting = true;
        SkipDomains = [ ];
        Locked = true;
      };

      ManagedBookmarks = [
        { toplevel_name = "Nix"; }
        {
          name = "Nix Manual (latest)";
          url = "https://nix.dev/manual/nix/latest/";
        }
        {
          name = "Nixpkgs Manual (unstable)";
          url = "https://nixos.org/manual/nixpkgs/unstable/";
        }
        {
          name = "NixOS Manual (unstable)";
          url = "https://nixos.org/manual/nixos/unstable/";
        }
        {
          name = "NixOS Options (unstable)";
          url = "https://search.nixos.org/options?channel=unstable&type=options";
        }
        {
          name = "Home-manager Options (unstable)";
          url = "https://search.nixos.org/options?channel=unstable&source=home_manager&type=options";
        }
        {
          name = "Nix Packages (unstable)";
          url = "https://search.nixos.org/packages?channel=unstable";
        }
        {
          name = "Noogle";
          url = "https://noogle.dev/";
        }
        {
          name = "NixOS/nixpkgs";
          url = "https://github.com/NixOS/nixpkgs/tree/nixos-unstable";
        }
      ];

      MicrosoftEntraSSO = false;

      NetworkPrediction = true;

      NewTabPage = true;

      NoDefaultBookmarks = true;

      OfferToSaveLogins = false;

      OverrideFirstRunPage = "";

      PasswordManagerEnabled = false;

      PasswordManagerExceptions = [ ];

      PDFjs = {
        Enabled = true;
        EnabledPermissions = true;
      };

      PopupBlocking = {
        Allow = [ ];
        Default = false;
        Locked = true;
      };

      PostQuantumKeyAgreementEnabled = true;

      PrivateBrowsingModeAvailability = 0;

      PromptForDownloadLocation = false;

      Proxy = {
        Mode = "system";
        Locked = true;
      };

      RequestedLocales = [
        "en-US"
        "pt-BR"
      ];

      SearchBar = "unified";

      SearchEngines = {
        Default = "DuckDuckGo No-AI";
        PreventInstalls = true;

        Remove = [
          "DuckDuckGo"
          "Google"
          "Bing"
          "Perplexity"
          "Wikipedia (en)"
        ];

        Add =
          let
            searchTerms = "{searchTerms}";
          in
          [
            (
              let
                baseUrl = "https://noai.duckduckgo.com";

                resultsSettings = [
                  "q=${searchTerms}" # Query
                  "kl=wt-wt" # Region: All regions
                  "kp=-1" # Safe Search: Moderate
                  "kz=-1" # Instant Answers: Off
                  "kc=1" # Auto-load Images: On
                  "kav=1" # Auto-load Results: On
                  "kn=-1" # Open in New Window: Off
                  "kf=fw" # Favicons: All WOT + favicons
                  "kaf=1" # Full URLs: On
                  "kac=1" # Auto-suggest: On
                ];

                privacySettings = [
                  "kd=-1" # Redirect: Off
                  "kh=1" # HTTPS: On
                  "kg=g" # Method: GET
                  "k5=2" # Video Playback: Open on third-party site
                ];

                lookAndFeelSettings = [
                  "kae=d" # Theme: Dark
                ];

                interfaceSettings = [
                  "ko=s" # Header: On & scrolling
                  "k1=-1" # Advertisements: Off
                  "kv=1" # Page Numbers: On
                  "kaj=n" # Units of Measure: Metric
                ];

                allSettings = lib.concatLists [
                  resultsSettings
                  privacySettings
                  lookAndFeelSettings
                  interfaceSettings
                ];

                queryString = lib.concatStringsSep "&" allSettings;
              in
              {
                Name = "DuckDuckGo No-AI";
                Description = "DuckDuckGo No-AI: Private Search Without AI";
                Alias = "@ddg";
                IconURL = "${baseUrl}/favicon.ico";
                URLTemplate = "${baseUrl}/?${queryString}";
                SuggestURLTemplate = "${baseUrl}/?${queryString}&type=list";
                PostData = queryString;
                Encoding = "UTF-8";
              }
            )
          ];
      };

      SearchSuggestEnabled = false;

      ShowHomeButton = false;

      SkipTermsOfUse = true;

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };

      VisualSearchEnabled = false;

      WindowsSSO = false;
    };
  };
}
