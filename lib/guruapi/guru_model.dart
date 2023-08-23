// To parse this JSON data, do
//
//     final guruApiModel = guruApiModelFromJson(jsonString);

import 'dart:convert';

Map<String, GuruApiModel> guruApiModelFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, GuruApiModel>(k, GuruApiModel.fromJson(v)));

String guruApiModelToJson(Map<String, GuruApiModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class GuruApiModel {
  DateTime added;
  String preferred;
  Map<String, VersionValue> versions;

  GuruApiModel({
    required this.added,
    required this.preferred,
    required this.versions,
  });

  factory GuruApiModel.fromJson(Map<String, dynamic> json) => GuruApiModel(
        added: DateTime.parse(json["added"]),
        preferred: json["preferred"],
        versions: Map.from(json["versions"]).map((k, v) =>
            MapEntry<String, VersionValue>(k, VersionValue.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "added": added.toIso8601String(),
        "preferred": preferred,
        "versions": Map.from(versions)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class VersionValue {
  DateTime added;
  Info info;
  DateTime updated;
  String swaggerUrl;
  String swaggerYamlUrl;
  OpenapiVer openapiVer;
  String link;
  ExternalDocs? externalDocs;

  VersionValue({
    required this.added,
    required this.info,
    required this.updated,
    required this.swaggerUrl,
    required this.swaggerYamlUrl,
    required this.openapiVer,
    required this.link,
    this.externalDocs,
  });

  factory VersionValue.fromJson(Map<String, dynamic> json) => VersionValue(
        added: DateTime.parse(json["added"]),
        info: Info.fromJson(json["info"]),
        updated: DateTime.parse(json["updated"]),
        swaggerUrl: json["swaggerUrl"],
        swaggerYamlUrl: json["swaggerYamlUrl"],
        openapiVer: openapiVerValues.map[json["openapiVer"]]!,
        link: json["link"],
        externalDocs: json["externalDocs"] == null
            ? null
            : ExternalDocs.fromJson(json["externalDocs"]),
      );

  Map<String, dynamic> toJson() => {
        "added": added.toIso8601String(),
        "info": info.toJson(),
        "updated": updated.toIso8601String(),
        "swaggerUrl": swaggerUrl,
        "swaggerYamlUrl": swaggerYamlUrl,
        "openapiVer": openapiVerValues.reverse[openapiVer],
        "link": link,
        "externalDocs": externalDocs?.toJson(),
      };
}

class ExternalDocs {
  String url;
  String? description;
  String? xSha1;

  ExternalDocs({
    required this.url,
    this.description,
    this.xSha1,
  });

  factory ExternalDocs.fromJson(Map<String, dynamic> json) => ExternalDocs(
        url: json["url"],
        description: json["description"],
        xSha1: json["x-sha1"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "description": description,
        "x-sha1": xSha1,
      };
}

class Info {
  Contact? contact;
  String? description;
  String title;
  String version;
  List<XElementHub>? xApisguruCategories;
  XLogo xLogo;
  List<XOrigin> xOrigin;
  String xProviderName;
  String? xServiceName;
  List<XTag>? xTags;
  String? termsOfService;
  License? license;
  Map<String, List<String>>? xReleaseNote;
  XStatus? xStatus;
  bool? xUnofficialSpec;
  bool? xPreferred;
  dynamic xApiClientRegistration;
  XCodegenSettings? xCodegenSettings;
  String? xDescriptionLanguage;
  XDocumentMetadata? xDocumentMetadata;
  String? xArtifactId;
  XTestOnEnvironment? xTestOnEnvironment;
  XDarkLogo? xDarkLogo;
  bool? xPublicVersion;
  DateTime? xTimestamp;
  String? xEndpointCost;
  String? xJellyfinVersion;
  String? xCategory;
  String? xLongDescription;
  bool? xPublic;
  String? xThumbnail;
  String? xVersionLifecycle;
  String? xWebsite;
  String? xLabel;
  XMsGeneratedBy? xMsGeneratedBy;
  String? xPlatform;
  String? xGithubPlan;
  double? xGithubRelease;
  XRelease? xRelease;
  String? xAwsSigningName;
  XMsCodeGenerationSettings? xMsCodeGenerationSettings;
  List<String>? xIssues;
  XServerConfiguration? xServerConfiguration;
  String? xApideckApi;
  bool? xApideckSdkSupport;
  List<String>? xDocsSchemaWhitelist;
  String? xPublicDescription;
  String? xSchemaId;
  String? summary;
  String? xLinkedin;
  String? xTwitter;
  String? xCliDescription;
  String? xCliName;
  String? xMasheryId;
  String? xIbmName;
  String? xImageUri;
  XElementHub? xElementHub;
  int? xElementId;
  String? xElementKey;
  String? xElementName;
  String? xComment;
  XDocumentMetaData? xDocumentMetaData;
  XOlpService? xOlpService;
  dynamic xTodoTermsOfService;
  String? xStripeSpecFilename;
  String? xChanges;
  String? xVersionInfo;

  Info({
    this.contact,
    this.description,
    required this.title,
    required this.version,
    this.xApisguruCategories,
    required this.xLogo,
    required this.xOrigin,
    required this.xProviderName,
    this.xServiceName,
    this.xTags,
    this.termsOfService,
    this.license,
    this.xReleaseNote,
    this.xStatus,
    this.xUnofficialSpec,
    this.xPreferred,
    this.xApiClientRegistration,
    this.xCodegenSettings,
    this.xDescriptionLanguage,
    this.xDocumentMetadata,
    this.xArtifactId,
    this.xTestOnEnvironment,
    this.xDarkLogo,
    this.xPublicVersion,
    this.xTimestamp,
    this.xEndpointCost,
    this.xJellyfinVersion,
    this.xCategory,
    this.xLongDescription,
    this.xPublic,
    this.xThumbnail,
    this.xVersionLifecycle,
    this.xWebsite,
    this.xLabel,
    this.xMsGeneratedBy,
    this.xPlatform,
    this.xGithubPlan,
    this.xGithubRelease,
    this.xRelease,
    this.xAwsSigningName,
    this.xMsCodeGenerationSettings,
    this.xIssues,
    this.xServerConfiguration,
    this.xApideckApi,
    this.xApideckSdkSupport,
    this.xDocsSchemaWhitelist,
    this.xPublicDescription,
    this.xSchemaId,
    this.summary,
    this.xLinkedin,
    this.xTwitter,
    this.xCliDescription,
    this.xCliName,
    this.xMasheryId,
    this.xIbmName,
    this.xImageUri,
    this.xElementHub,
    this.xElementId,
    this.xElementKey,
    this.xElementName,
    this.xComment,
    this.xDocumentMetaData,
    this.xOlpService,
    this.xTodoTermsOfService,
    this.xStripeSpecFilename,
    this.xChanges,
    this.xVersionInfo,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        description: json["description"],
        title: json["title"],
        version: json["version"],
        xApisguruCategories: json["x-apisguru-categories"] == null
            ? []
            : List<XElementHub>.from(json["x-apisguru-categories"]!
                .map((x) => xElementHubValues.map[x]!)),
        xLogo: XLogo.fromJson(json["x-logo"]),
        xOrigin: List<XOrigin>.from(
            json["x-origin"].map((x) => XOrigin.fromJson(x))),
        xProviderName: json["x-providerName"],
        xServiceName: json["x-serviceName"],
        xTags: json["x-tags"] == null
            ? []
            : List<XTag>.from(json["x-tags"]!.map((x) => xTagValues.map[x]!)),
        termsOfService: json["termsOfService"],
        license:
            json["license"] == null ? null : License.fromJson(json["license"]),
        xReleaseNote: Map.from(json["x-release-note"]!).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        xStatus: xStatusValues.map[json["x-status"]]!,
        xUnofficialSpec: json["x-unofficialSpec"],
        xPreferred: json["x-preferred"],
        xApiClientRegistration: json["x-apiClientRegistration"],
        xCodegenSettings: json["x-codegen-settings"] == null
            ? null
            : XCodegenSettings.fromJson(json["x-codegen-settings"]),
        xDescriptionLanguage: json["x-description-language"],
        xDocumentMetadata: json["x-document-metadata"] == null
            ? null
            : XDocumentMetadata.fromJson(json["x-document-metadata"]),
        xArtifactId: json["x-artifactId"],
        xTestOnEnvironment: json["x-test-on-environment"] == null
            ? null
            : XTestOnEnvironment.fromJson(json["x-test-on-environment"]),
        xDarkLogo: json["x-dark-logo"] == null
            ? null
            : XDarkLogo.fromJson(json["x-dark-logo"]),
        xPublicVersion: json["x-publicVersion"],
        xTimestamp: json["x-timestamp"] == null
            ? null
            : DateTime.parse(json["x-timestamp"]),
        xEndpointCost: json["x-endpoint-cost"],
        xJellyfinVersion: json["x-jellyfin-version"],
        xCategory: json["x-category"],
        xLongDescription: json["x-long-description"],
        xPublic: json["x-public"],
        xThumbnail: json["x-thumbnail"],
        xVersionLifecycle: json["x-version-lifecycle"],
        xWebsite: json["x-website"],
        xLabel: json["x-label"],
        xMsGeneratedBy: json["x-ms-generated-by"] == null
            ? null
            : XMsGeneratedBy.fromJson(json["x-ms-generated-by"]),
        xPlatform: json["x-platform"],
        xGithubPlan: json["x-github-plan"],
        xGithubRelease: json["x-github-release"]?.toDouble(),
        xRelease: xReleaseValues.map[json["x-release"]]!,
        xAwsSigningName: json["x-aws-signingName"],
        xMsCodeGenerationSettings: json["x-ms-code-generation-settings"] == null
            ? null
            : XMsCodeGenerationSettings.fromJson(
                json["x-ms-code-generation-settings"]),
        xIssues: json["x-issues"] == null
            ? []
            : List<String>.from(json["x-issues"]!.map((x) => x)),
        xServerConfiguration: json["x-server-configuration"] == null
            ? null
            : XServerConfiguration.fromJson(json["x-server-configuration"]),
        xApideckApi: json["x-apideck-api"],
        xApideckSdkSupport: json["x-apideck-sdk-support"],
        xDocsSchemaWhitelist: json["x-docs-schema-whitelist"] == null
            ? []
            : List<String>.from(json["x-docs-schema-whitelist"]!.map((x) => x)),
        xPublicDescription: json["x-public-description"],
        xSchemaId: json["x-schema-id"],
        summary: json["summary"],
        xLinkedin: json["x-linkedin"],
        xTwitter: json["x-twitter"],
        xCliDescription: json["x-cli-description"],
        xCliName: json["x-cli-name"],
        xMasheryId: json["x-mashery-id"],
        xIbmName: json["x-ibm-name"],
        xImageUri: json["x-image-uri"],
        xElementHub: xElementHubValues.map[json["x-element-hub"]]!,
        xElementId: json["x-element-id"],
        xElementKey: json["x-element-key"],
        xElementName: json["x-element-name"],
        xComment: json["x-comment"],
        xDocumentMetaData: json["x-document-meta-data"] == null
            ? null
            : XDocumentMetaData.fromJson(json["x-document-meta-data"]),
        xOlpService: json["x-olp-service"] == null
            ? null
            : XOlpService.fromJson(json["x-olp-service"]),
        xTodoTermsOfService: json["x-TODO-termsOfService"],
        xStripeSpecFilename: json["x-stripeSpecFilename"],
        xChanges: json["x-changes"],
        xVersionInfo: json["x-version-info"],
      );

  Map<String, dynamic> toJson() => {
        "contact": contact?.toJson(),
        "description": description,
        "title": title,
        "version": version,
        "x-apisguru-categories": xApisguruCategories == null
            ? []
            : List<dynamic>.from(
                xApisguruCategories!.map((x) => xElementHubValues.reverse[x])),
        "x-logo": xLogo.toJson(),
        "x-origin": List<dynamic>.from(xOrigin.map((x) => x.toJson())),
        "x-providerName": xProviderName,
        "x-serviceName": xServiceName,
        "x-tags": xTags == null
            ? []
            : List<dynamic>.from(xTags!.map((x) => xTagValues.reverse[x])),
        "termsOfService": termsOfService,
        "license": license?.toJson(),
        "x-release-note": Map.from(xReleaseNote!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "x-status": xStatusValues.reverse[xStatus],
        "x-unofficialSpec": xUnofficialSpec,
        "x-preferred": xPreferred,
        "x-apiClientRegistration": xApiClientRegistration,
        "x-codegen-settings": xCodegenSettings?.toJson(),
        "x-description-language": xDescriptionLanguage,
        "x-document-metadata": xDocumentMetadata?.toJson(),
        "x-artifactId": xArtifactId,
        "x-test-on-environment": xTestOnEnvironment?.toJson(),
        "x-dark-logo": xDarkLogo?.toJson(),
        "x-publicVersion": xPublicVersion,
        "x-timestamp": xTimestamp?.toIso8601String(),
        "x-endpoint-cost": xEndpointCost,
        "x-jellyfin-version": xJellyfinVersion,
        "x-category": xCategory,
        "x-long-description": xLongDescription,
        "x-public": xPublic,
        "x-thumbnail": xThumbnail,
        "x-version-lifecycle": xVersionLifecycle,
        "x-website": xWebsite,
        "x-label": xLabel,
        "x-ms-generated-by": xMsGeneratedBy?.toJson(),
        "x-platform": xPlatform,
        "x-github-plan": xGithubPlan,
        "x-github-release": xGithubRelease,
        "x-release": xReleaseValues.reverse[xRelease],
        "x-aws-signingName": xAwsSigningName,
        "x-ms-code-generation-settings": xMsCodeGenerationSettings?.toJson(),
        "x-issues":
            xIssues == null ? [] : List<dynamic>.from(xIssues!.map((x) => x)),
        "x-server-configuration": xServerConfiguration?.toJson(),
        "x-apideck-api": xApideckApi,
        "x-apideck-sdk-support": xApideckSdkSupport,
        "x-docs-schema-whitelist": xDocsSchemaWhitelist == null
            ? []
            : List<dynamic>.from(xDocsSchemaWhitelist!.map((x) => x)),
        "x-public-description": xPublicDescription,
        "x-schema-id": xSchemaId,
        "summary": summary,
        "x-linkedin": xLinkedin,
        "x-twitter": xTwitter,
        "x-cli-description": xCliDescription,
        "x-cli-name": xCliName,
        "x-mashery-id": xMasheryId,
        "x-ibm-name": xIbmName,
        "x-image-uri": xImageUri,
        "x-element-hub": xElementHubValues.reverse[xElementHub],
        "x-element-id": xElementId,
        "x-element-key": xElementKey,
        "x-element-name": xElementName,
        "x-comment": xComment,
        "x-document-meta-data": xDocumentMetaData?.toJson(),
        "x-olp-service": xOlpService?.toJson(),
        "x-TODO-termsOfService": xTodoTermsOfService,
        "x-stripeSpecFilename": xStripeSpecFilename,
        "x-changes": xChanges,
        "x-version-info": xVersionInfo,
      };
}

class Contact {
  String? email;
  String? name;
  String? url;
  String? xTwitter;
  String? xLogo;
  String? xResponsibleDeveloper;
  String? xResponsibleOrganization;
  String? xPhone;
  String? xTermsOfService;

  Contact({
    this.email,
    this.name,
    this.url,
    this.xTwitter,
    this.xLogo,
    this.xResponsibleDeveloper,
    this.xResponsibleOrganization,
    this.xPhone,
    this.xTermsOfService,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json["email"],
        name: json["name"],
        url: json["url"],
        xTwitter: json["x-twitter"],
        xLogo: json["x-logo"],
        xResponsibleDeveloper: json["x-responsibleDeveloper"],
        xResponsibleOrganization: json["x-responsibleOrganization"],
        xPhone: json["x-phone"],
        xTermsOfService: json["x-termsOfService"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "url": url,
        "x-twitter": xTwitter,
        "x-logo": xLogo,
        "x-responsibleDeveloper": xResponsibleDeveloper,
        "x-responsibleOrganization": xResponsibleOrganization,
        "x-phone": xPhone,
        "x-termsOfService": xTermsOfService,
      };
}

class License {
  String name;
  String? url;
  String? xCopyright;
  String? xSpdx;

  License({
    required this.name,
    this.url,
    this.xCopyright,
    this.xSpdx,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
        xCopyright: json["x-copyright"],
        xSpdx: json["x-spdx"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "x-copyright": xCopyright,
        "x-spdx": xSpdx,
      };
}

class XApiClientRegistrationClass {
  String url;

  XApiClientRegistrationClass({
    required this.url,
  });

  factory XApiClientRegistrationClass.fromJson(Map<String, dynamic> json) =>
      XApiClientRegistrationClass(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

enum XElementHub {
  ANALYTICS,
  BACKEND,
  C,
  CLOUD,
  COLLABORATION,
  CUSTOMER_RELATION,
  DEVELOPER_TOOLS,
  E,
  ECOMMERCE,
  EDUCATION,
  EMAIL,
  ENTERPRISE,
  ENTERTAINMENT,
  FINANCIAL,
  FORMS,
  HOSTING,
  I,
  IOT,
  LOCATION,
  MACHINE_LEARNING,
  MARKETING,
  MEDIA,
  MESSAGING,
  MONITORING,
  OPEN_DATA,
  PAYMENT,
  PROJECT_MANAGEMENT,
  R,
  S,
  SEARCH,
  SECURITY,
  SOCIAL,
  STORAGE,
  SUPPORT,
  T,
  TELECOM,
  TEXT,
  TIME_MANAGEMENT,
  TOOLS,
  TRANSPORT,
  U,
  Y
}

final xElementHubValues = EnumValues({
  "analytics": XElementHub.ANALYTICS,
  "backend": XElementHub.BACKEND,
  "c": XElementHub.C,
  "cloud": XElementHub.CLOUD,
  "collaboration": XElementHub.COLLABORATION,
  "customer_relation": XElementHub.CUSTOMER_RELATION,
  "developer_tools": XElementHub.DEVELOPER_TOOLS,
  "e": XElementHub.E,
  "ecommerce": XElementHub.ECOMMERCE,
  "education": XElementHub.EDUCATION,
  "email": XElementHub.EMAIL,
  "enterprise": XElementHub.ENTERPRISE,
  "entertainment": XElementHub.ENTERTAINMENT,
  "financial": XElementHub.FINANCIAL,
  "forms": XElementHub.FORMS,
  "hosting": XElementHub.HOSTING,
  "i": XElementHub.I,
  "iot": XElementHub.IOT,
  "location": XElementHub.LOCATION,
  "machine_learning": XElementHub.MACHINE_LEARNING,
  "marketing": XElementHub.MARKETING,
  "media": XElementHub.MEDIA,
  "messaging": XElementHub.MESSAGING,
  "monitoring": XElementHub.MONITORING,
  "open_data": XElementHub.OPEN_DATA,
  "payment": XElementHub.PAYMENT,
  "project_management": XElementHub.PROJECT_MANAGEMENT,
  "r": XElementHub.R,
  "s": XElementHub.S,
  "search": XElementHub.SEARCH,
  "security": XElementHub.SECURITY,
  "social": XElementHub.SOCIAL,
  "storage": XElementHub.STORAGE,
  "support": XElementHub.SUPPORT,
  "t": XElementHub.T,
  "telecom": XElementHub.TELECOM,
  "text": XElementHub.TEXT,
  "time_management": XElementHub.TIME_MANAGEMENT,
  "tools": XElementHub.TOOLS,
  "transport": XElementHub.TRANSPORT,
  "u": XElementHub.U,
  "y": XElementHub.Y
});

class XCodegenSettings {
  String? xCodegenSettingsArraySerialization;
  String? brandLabel;
  bool? xCodegenSettingsCollectParameters;
  String? xCodegenSettingsNodeHttpClient;
  bool? xCodegenSettingsUseConstructorsForConfig;
  bool? useControllerPostfix;
  bool? xCodegenSettingsUseEnumPostfix;
  bool? xCodegenSettingsUseMethodPrefix;
  bool? xCodegenSettingsUseModelPostfix;
  bool? allowSkippingSslCertVerification;
  bool? androidUseAppManifest;
  bool? appendContentHeaders;
  List<dynamic>? applyCustomizations;
  String? arraySerialization;
  int? bodySerialization;
  bool? collectParameters;
  bool? disableDocs;
  bool? disableLinting;
  List<dynamic>? doNotSplitWords;
  bool? enableAdditionalModelProperties;
  bool? enableGlobalUserAgent;
  bool? enableHttpCache;
  bool? enableLogging;
  bool? enablePhpComposerVersionString;
  bool? forceKeywordArgsInRuby;
  bool? generateAdvancedDocs;
  bool? generateAppveyorConfig;
  bool? generateAsyncCode;
  bool? generateCircleConfig;
  bool? generateExceptions;
  bool? generateInterfaces;
  bool? generateJenkinsConfig;
  bool? generateModels;
  bool? generateTravisConfig;
  bool? ignoreIfNullJson;
  String? javaHttpClient;
  bool? javaUsePropertiesConfig;
  bool? liftParameterDescriptionFromCustomType;
  String? modelSerializationScheme;
  String? nodeHttpClient;
  bool? nullify404;
  String? parameterArrayFormat;
  bool? preserveParameterOrder;
  ResponseMapping? responseMapping;
  int? retries;
  int? retryInterval;
  bool? returnCompleteHttpResponse;
  bool? runscopeEnabled;
  List<String>? securityProtocols;
  bool? sortResources;
  bool? storeTimezoneInformation;
  bool? symbolizeHashKeysInRuby;
  bool? throwForHttpErrorStatusCodes;
  int? timeout;
  bool? underscoreNumbers;
  bool? useCommonSdkLibrary;
  bool? useConstructorsForConfig;
  bool? useControllerPrefix;
  bool? useEnumPostfix;
  bool? useExceptionPrefix;
  bool? useMethodPrefix;
  bool? useModelPostfix;
  bool? useSingletonPattern;
  bool? validateRequiredParameters;
  bool? iOsGenerateCoreData;
  bool? iOsUseAppInfoPlist;
  String? androidHttpClient;
  int? backoffFactor;
  String? cSharpHttpClient;
  bool? enableImmutableModels;
  bool? encodeTemplateParameters;
  bool? generateEnums;
  bool? isLatestVersion;
  String? objCHttpClient;
  String? phpHttpClient;
  UsageExampleEndpoint? usageExampleEndpoint;
  bool? useEndpointMethodName;
  bool? userConfigurableRetries;

  XCodegenSettings({
    this.xCodegenSettingsArraySerialization,
    this.brandLabel,
    this.xCodegenSettingsCollectParameters,
    this.xCodegenSettingsNodeHttpClient,
    this.xCodegenSettingsUseConstructorsForConfig,
    this.useControllerPostfix,
    this.xCodegenSettingsUseEnumPostfix,
    this.xCodegenSettingsUseMethodPrefix,
    this.xCodegenSettingsUseModelPostfix,
    this.allowSkippingSslCertVerification,
    this.androidUseAppManifest,
    this.appendContentHeaders,
    this.applyCustomizations,
    this.arraySerialization,
    this.bodySerialization,
    this.collectParameters,
    this.disableDocs,
    this.disableLinting,
    this.doNotSplitWords,
    this.enableAdditionalModelProperties,
    this.enableGlobalUserAgent,
    this.enableHttpCache,
    this.enableLogging,
    this.enablePhpComposerVersionString,
    this.forceKeywordArgsInRuby,
    this.generateAdvancedDocs,
    this.generateAppveyorConfig,
    this.generateAsyncCode,
    this.generateCircleConfig,
    this.generateExceptions,
    this.generateInterfaces,
    this.generateJenkinsConfig,
    this.generateModels,
    this.generateTravisConfig,
    this.ignoreIfNullJson,
    this.javaHttpClient,
    this.javaUsePropertiesConfig,
    this.liftParameterDescriptionFromCustomType,
    this.modelSerializationScheme,
    this.nodeHttpClient,
    this.nullify404,
    this.parameterArrayFormat,
    this.preserveParameterOrder,
    this.responseMapping,
    this.retries,
    this.retryInterval,
    this.returnCompleteHttpResponse,
    this.runscopeEnabled,
    this.securityProtocols,
    this.sortResources,
    this.storeTimezoneInformation,
    this.symbolizeHashKeysInRuby,
    this.throwForHttpErrorStatusCodes,
    this.timeout,
    this.underscoreNumbers,
    this.useCommonSdkLibrary,
    this.useConstructorsForConfig,
    this.useControllerPrefix,
    this.useEnumPostfix,
    this.useExceptionPrefix,
    this.useMethodPrefix,
    this.useModelPostfix,
    this.useSingletonPattern,
    this.validateRequiredParameters,
    this.iOsGenerateCoreData,
    this.iOsUseAppInfoPlist,
    this.androidHttpClient,
    this.backoffFactor,
    this.cSharpHttpClient,
    this.enableImmutableModels,
    this.encodeTemplateParameters,
    this.generateEnums,
    this.isLatestVersion,
    this.objCHttpClient,
    this.phpHttpClient,
    this.usageExampleEndpoint,
    this.useEndpointMethodName,
    this.userConfigurableRetries,
  });

  factory XCodegenSettings.fromJson(Map<String, dynamic> json) =>
      XCodegenSettings(
        xCodegenSettingsArraySerialization: json["arraySerialization"],
        brandLabel: json["brandLabel"],
        xCodegenSettingsCollectParameters: json["collectParameters"],
        xCodegenSettingsNodeHttpClient: json["nodeHttpClient"],
        xCodegenSettingsUseConstructorsForConfig:
            json["useConstructorsForConfig"],
        useControllerPostfix: json["useControllerPostfix"],
        xCodegenSettingsUseEnumPostfix: json["useEnumPostfix"],
        xCodegenSettingsUseMethodPrefix: json["useMethodPrefix"],
        xCodegenSettingsUseModelPostfix: json["useModelPostfix"],
        allowSkippingSslCertVerification:
            json["AllowSkippingSSLCertVerification"],
        androidUseAppManifest: json["AndroidUseAppManifest"],
        appendContentHeaders: json["AppendContentHeaders"],
        applyCustomizations: json["ApplyCustomizations"] == null
            ? []
            : List<dynamic>.from(json["ApplyCustomizations"]!.map((x) => x)),
        arraySerialization: json["ArraySerialization"],
        bodySerialization: json["BodySerialization"],
        collectParameters: json["CollectParameters"],
        disableDocs: json["DisableDocs"],
        disableLinting: json["DisableLinting"],
        doNotSplitWords: json["DoNotSplitWords"] == null
            ? []
            : List<dynamic>.from(json["DoNotSplitWords"]!.map((x) => x)),
        enableAdditionalModelProperties:
            json["EnableAdditionalModelProperties"],
        enableGlobalUserAgent: json["EnableGlobalUserAgent"],
        enableHttpCache: json["EnableHttpCache"],
        enableLogging: json["EnableLogging"],
        enablePhpComposerVersionString: json["EnablePHPComposerVersionString"],
        forceKeywordArgsInRuby: json["ForceKeywordArgsInRuby"],
        generateAdvancedDocs: json["GenerateAdvancedDocs"],
        generateAppveyorConfig: json["GenerateAppveyorConfig"],
        generateAsyncCode: json["GenerateAsyncCode"],
        generateCircleConfig: json["GenerateCircleConfig"],
        generateExceptions: json["GenerateExceptions"],
        generateInterfaces: json["GenerateInterfaces"],
        generateJenkinsConfig: json["GenerateJenkinsConfig"],
        generateModels: json["GenerateModels"],
        generateTravisConfig: json["GenerateTravisConfig"],
        ignoreIfNullJson: json["IgnoreIfNullJson"],
        javaHttpClient: json["JavaHttpClient"],
        javaUsePropertiesConfig: json["JavaUsePropertiesConfig"],
        liftParameterDescriptionFromCustomType:
            json["LiftParameterDescriptionFromCustomType"],
        modelSerializationScheme: json["ModelSerializationScheme"],
        nodeHttpClient: json["NodeHttpClient"],
        nullify404: json["Nullify404"],
        parameterArrayFormat: json["ParameterArrayFormat"],
        preserveParameterOrder: json["PreserveParameterOrder"],
        responseMapping: json["ResponseMapping"] == null
            ? null
            : ResponseMapping.fromJson(json["ResponseMapping"]),
        retries: json["Retries"],
        retryInterval: json["RetryInterval"],
        returnCompleteHttpResponse: json["ReturnCompleteHttpResponse"],
        runscopeEnabled: json["RunscopeEnabled"],
        securityProtocols: json["SecurityProtocols"] == null
            ? []
            : List<String>.from(json["SecurityProtocols"]!.map((x) => x)),
        sortResources: json["SortResources"],
        storeTimezoneInformation: json["StoreTimezoneInformation"],
        symbolizeHashKeysInRuby: json["SymbolizeHashKeysInRuby"],
        throwForHttpErrorStatusCodes: json["ThrowForHttpErrorStatusCodes"],
        timeout: json["Timeout"],
        underscoreNumbers: json["UnderscoreNumbers"],
        useCommonSdkLibrary: json["UseCommonSDKLibrary"],
        useConstructorsForConfig: json["UseConstructorsForConfig"],
        useControllerPrefix: json["UseControllerPrefix"],
        useEnumPostfix: json["UseEnumPostfix"],
        useExceptionPrefix: json["UseExceptionPrefix"],
        useMethodPrefix: json["UseMethodPrefix"],
        useModelPostfix: json["UseModelPostfix"],
        useSingletonPattern: json["UseSingletonPattern"],
        validateRequiredParameters: json["ValidateRequiredParameters"],
        iOsGenerateCoreData: json["iOSGenerateCoreData"],
        iOsUseAppInfoPlist: json["iOSUseAppInfoPlist"],
        androidHttpClient: json["AndroidHttpClient"],
        backoffFactor: json["BackoffFactor"],
        cSharpHttpClient: json["CSharpHttpClient"],
        enableImmutableModels: json["EnableImmutableModels"],
        encodeTemplateParameters: json["EncodeTemplateParameters"],
        generateEnums: json["GenerateEnums"],
        isLatestVersion: json["IsLatestVersion"],
        objCHttpClient: json["ObjCHttpClient"],
        phpHttpClient: json["PHPHttpClient"],
        usageExampleEndpoint: json["UsageExampleEndpoint"] == null
            ? null
            : UsageExampleEndpoint.fromJson(json["UsageExampleEndpoint"]),
        useEndpointMethodName: json["UseEndpointMethodName"],
        userConfigurableRetries: json["UserConfigurableRetries"],
      );

  Map<String, dynamic> toJson() => {
        "arraySerialization": xCodegenSettingsArraySerialization,
        "brandLabel": brandLabel,
        "collectParameters": xCodegenSettingsCollectParameters,
        "nodeHttpClient": xCodegenSettingsNodeHttpClient,
        "useConstructorsForConfig": xCodegenSettingsUseConstructorsForConfig,
        "useControllerPostfix": useControllerPostfix,
        "useEnumPostfix": xCodegenSettingsUseEnumPostfix,
        "useMethodPrefix": xCodegenSettingsUseMethodPrefix,
        "useModelPostfix": xCodegenSettingsUseModelPostfix,
        "AllowSkippingSSLCertVerification": allowSkippingSslCertVerification,
        "AndroidUseAppManifest": androidUseAppManifest,
        "AppendContentHeaders": appendContentHeaders,
        "ApplyCustomizations": applyCustomizations == null
            ? []
            : List<dynamic>.from(applyCustomizations!.map((x) => x)),
        "ArraySerialization": arraySerialization,
        "BodySerialization": bodySerialization,
        "CollectParameters": collectParameters,
        "DisableDocs": disableDocs,
        "DisableLinting": disableLinting,
        "DoNotSplitWords": doNotSplitWords == null
            ? []
            : List<dynamic>.from(doNotSplitWords!.map((x) => x)),
        "EnableAdditionalModelProperties": enableAdditionalModelProperties,
        "EnableGlobalUserAgent": enableGlobalUserAgent,
        "EnableHttpCache": enableHttpCache,
        "EnableLogging": enableLogging,
        "EnablePHPComposerVersionString": enablePhpComposerVersionString,
        "ForceKeywordArgsInRuby": forceKeywordArgsInRuby,
        "GenerateAdvancedDocs": generateAdvancedDocs,
        "GenerateAppveyorConfig": generateAppveyorConfig,
        "GenerateAsyncCode": generateAsyncCode,
        "GenerateCircleConfig": generateCircleConfig,
        "GenerateExceptions": generateExceptions,
        "GenerateInterfaces": generateInterfaces,
        "GenerateJenkinsConfig": generateJenkinsConfig,
        "GenerateModels": generateModels,
        "GenerateTravisConfig": generateTravisConfig,
        "IgnoreIfNullJson": ignoreIfNullJson,
        "JavaHttpClient": javaHttpClient,
        "JavaUsePropertiesConfig": javaUsePropertiesConfig,
        "LiftParameterDescriptionFromCustomType":
            liftParameterDescriptionFromCustomType,
        "ModelSerializationScheme": modelSerializationScheme,
        "NodeHttpClient": nodeHttpClient,
        "Nullify404": nullify404,
        "ParameterArrayFormat": parameterArrayFormat,
        "PreserveParameterOrder": preserveParameterOrder,
        "ResponseMapping": responseMapping?.toJson(),
        "Retries": retries,
        "RetryInterval": retryInterval,
        "ReturnCompleteHttpResponse": returnCompleteHttpResponse,
        "RunscopeEnabled": runscopeEnabled,
        "SecurityProtocols": securityProtocols == null
            ? []
            : List<dynamic>.from(securityProtocols!.map((x) => x)),
        "SortResources": sortResources,
        "StoreTimezoneInformation": storeTimezoneInformation,
        "SymbolizeHashKeysInRuby": symbolizeHashKeysInRuby,
        "ThrowForHttpErrorStatusCodes": throwForHttpErrorStatusCodes,
        "Timeout": timeout,
        "UnderscoreNumbers": underscoreNumbers,
        "UseCommonSDKLibrary": useCommonSdkLibrary,
        "UseConstructorsForConfig": useConstructorsForConfig,
        "UseControllerPrefix": useControllerPrefix,
        "UseEnumPostfix": useEnumPostfix,
        "UseExceptionPrefix": useExceptionPrefix,
        "UseMethodPrefix": useMethodPrefix,
        "UseModelPostfix": useModelPostfix,
        "UseSingletonPattern": useSingletonPattern,
        "ValidateRequiredParameters": validateRequiredParameters,
        "iOSGenerateCoreData": iOsGenerateCoreData,
        "iOSUseAppInfoPlist": iOsUseAppInfoPlist,
        "AndroidHttpClient": androidHttpClient,
        "BackoffFactor": backoffFactor,
        "CSharpHttpClient": cSharpHttpClient,
        "EnableImmutableModels": enableImmutableModels,
        "EncodeTemplateParameters": encodeTemplateParameters,
        "GenerateEnums": generateEnums,
        "IsLatestVersion": isLatestVersion,
        "ObjCHttpClient": objCHttpClient,
        "PHPHttpClient": phpHttpClient,
        "UsageExampleEndpoint": usageExampleEndpoint?.toJson(),
        "UseEndpointMethodName": useEndpointMethodName,
        "UserConfigurableRetries": userConfigurableRetries,
      };
}

class ResponseMapping {
  String type;

  ResponseMapping({
    required this.type,
  });

  factory ResponseMapping.fromJson(Map<String, dynamic> json) =>
      ResponseMapping(
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
      };
}

class UsageExampleEndpoint {
  String description;
  String endpointGroupName;
  String endpointName;

  UsageExampleEndpoint({
    required this.description,
    required this.endpointGroupName,
    required this.endpointName,
  });

  factory UsageExampleEndpoint.fromJson(Map<String, dynamic> json) =>
      UsageExampleEndpoint(
        description: json["Description"],
        endpointGroupName: json["EndpointGroupName"],
        endpointName: json["EndpointName"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description,
        "EndpointGroupName": endpointGroupName,
        "EndpointName": endpointName,
      };
}

class XDarkLogo {
  String altText;
  String url;

  XDarkLogo({
    required this.altText,
    required this.url,
  });

  factory XDarkLogo.fromJson(Map<String, dynamic> json) => XDarkLogo(
        altText: json["altText"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "altText": altText,
        "url": url,
      };
}

class XDocumentMetaData {
  String copyright;
  DateTime dateCreated;
  String documentId;

  XDocumentMetaData({
    required this.copyright,
    required this.dateCreated,
    required this.documentId,
  });

  factory XDocumentMetaData.fromJson(Map<String, dynamic> json) =>
      XDocumentMetaData(
        copyright: json["copyright"],
        dateCreated: DateTime.parse(json["date-created"]),
        documentId: json["document-id"],
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date-created": dateCreated.toIso8601String(),
        "document-id": documentId,
      };
}

class XDocumentMetadata {
  String copyright;
  String dateCreated;
  String traceId;

  XDocumentMetadata({
    required this.copyright,
    required this.dateCreated,
    required this.traceId,
  });

  factory XDocumentMetadata.fromJson(Map<String, dynamic> json) =>
      XDocumentMetadata(
        copyright: json["copyright"],
        dateCreated: json["date-created"],
        traceId: json["trace-id"],
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date-created": dateCreated,
        "trace-id": traceId,
      };
}

class XLogo {
  String? backgroundColor;
  String url;
  String? href;
  String? altText;

  XLogo({
    this.backgroundColor,
    required this.url,
    this.href,
    this.altText,
  });

  factory XLogo.fromJson(Map<String, dynamic> json) => XLogo(
        backgroundColor: json["backgroundColor"],
        url: json["url"],
        href: json["href"],
        altText: json["altText"],
      );

  Map<String, dynamic> toJson() => {
        "backgroundColor": backgroundColor,
        "url": url,
        "href": href,
        "altText": altText,
      };
}

class XMsCodeGenerationSettings {
  String? name;
  Header? header;
  String? host;
  String? syncMethods;

  XMsCodeGenerationSettings({
    this.name,
    this.header,
    this.host,
    this.syncMethods,
  });

  factory XMsCodeGenerationSettings.fromJson(Map<String, dynamic> json) =>
      XMsCodeGenerationSettings(
        name: json["name"],
        header: headerValues.map[json["header"]]!,
        host: json["host"],
        syncMethods: json["syncMethods"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "header": headerValues.reverse[header],
        "host": host,
        "syncMethods": syncMethods,
      };
}

enum Header { MICROSOFT_MIT_NO_VERSION }

final headerValues =
    EnumValues({"MICROSOFT_MIT_NO_VERSION": Header.MICROSOFT_MIT_NO_VERSION});

class XMsGeneratedBy {
  String toolName;
  String toolVersion;

  XMsGeneratedBy({
    required this.toolName,
    required this.toolVersion,
  });

  factory XMsGeneratedBy.fromJson(Map<String, dynamic> json) => XMsGeneratedBy(
        toolName: json["toolName"],
        toolVersion: json["toolVersion"],
      );

  Map<String, dynamic> toJson() => {
        "toolName": toolName,
        "toolVersion": toolVersion,
      };
}

class XOlpService {
  String name;
  XRelease version;

  XOlpService({
    required this.name,
    required this.version,
  });

  factory XOlpService.fromJson(Map<String, dynamic> json) => XOlpService(
        name: json["name"],
        version: xReleaseValues.map[json["version"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": xReleaseValues.reverse[version],
      };
}

enum XRelease { S3, S3_V4, THE_100844, V2, V4 }

final xReleaseValues = EnumValues({
  "s3": XRelease.S3,
  "s3v4": XRelease.S3_V4,
  "1.0.0-844": XRelease.THE_100844,
  "v2": XRelease.V2,
  "v4": XRelease.V4
});

class XOrigin {
  Format? format;
  String url;
  XOriginVersion? version;
  Converter? converter;
  ContentType? contentType;
  XApisguruDriver? xApisguruDriver;

  XOrigin({
    this.format,
    required this.url,
    this.version,
    this.converter,
    this.contentType,
    this.xApisguruDriver,
  });

  factory XOrigin.fromJson(Map<String, dynamic> json) => XOrigin(
        format: formatValues.map[json["format"]]!,
        url: json["url"],
        version: xOriginVersionValues.map[json["version"]]!,
        converter: json["converter"] == null
            ? null
            : Converter.fromJson(json["converter"]),
        contentType: contentTypeValues.map[json["contentType"]]!,
        xApisguruDriver: xApisguruDriverValues.map[json["x-apisguru-driver"]]!,
      );

  Map<String, dynamic> toJson() => {
        "format": formatValues.reverse[format],
        "url": url,
        "version": xOriginVersionValues.reverse[version],
        "converter": converter?.toJson(),
        "contentType": contentTypeValues.reverse[contentType],
        "x-apisguru-driver": xApisguruDriverValues.reverse[xApisguruDriver],
      };
}

enum ContentType { APPLICATION_JSON }

final contentTypeValues =
    EnumValues({"application/json": ContentType.APPLICATION_JSON});

class Converter {
  String url;
  ConverterVersion version;

  Converter({
    required this.url,
    required this.version,
  });

  factory Converter.fromJson(Map<String, dynamic> json) => Converter(
        url: json["url"],
        version: converterVersionValues.map[json["version"]]!,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "version": converterVersionValues.reverse[version],
      };
}

enum ConverterVersion {
  THE_100,
  THE_131,
  THE_201,
  THE_260,
  THE_262,
  THE_2711,
  THE_2718,
  THE_2725,
  THE_2731,
  THE_704
}

final converterVersionValues = EnumValues({
  "1.0.0": ConverterVersion.THE_100,
  "1.3.1": ConverterVersion.THE_131,
  "2.0.1": ConverterVersion.THE_201,
  "2.6.0": ConverterVersion.THE_260,
  "2.6.2": ConverterVersion.THE_262,
  "2.7.11": ConverterVersion.THE_2711,
  "2.7.18": ConverterVersion.THE_2718,
  "2.7.25": ConverterVersion.THE_2725,
  "2.7.31": ConverterVersion.THE_2731,
  "7.0.4": ConverterVersion.THE_704
});

enum Format { API_BLUEPRINT, GOOGLE, OPENAPI, POSTMAN, SWAGGER, WADL }

final formatValues = EnumValues({
  "apiBlueprint": Format.API_BLUEPRINT,
  "google": Format.GOOGLE,
  "openapi": Format.OPENAPI,
  "postman": Format.POSTMAN,
  "swagger": Format.SWAGGER,
  "wadl": Format.WADL
});

enum XOriginVersion {
  THE_10,
  THE_12,
  THE_1_A,
  THE_20,
  THE_2_X,
  THE_30,
  THE_31,
  V1
}

final xOriginVersionValues = EnumValues({
  "1.0": XOriginVersion.THE_10,
  "1.2": XOriginVersion.THE_12,
  "1A": XOriginVersion.THE_1_A,
  "2.0": XOriginVersion.THE_20,
  "2.x": XOriginVersion.THE_2_X,
  "3.0": XOriginVersion.THE_30,
  "3.1": XOriginVersion.THE_31,
  "v1": XOriginVersion.V1
});

enum XApisguruDriver { EXTERNAL }

final xApisguruDriverValues =
    EnumValues({"external": XApisguruDriver.EXTERNAL});

class XServerConfiguration {
  String defaultEnvironment;
  String defaultServer;
  List<Environment> environments;
  List<dynamic> parameters;

  XServerConfiguration({
    required this.defaultEnvironment,
    required this.defaultServer,
    required this.environments,
    required this.parameters,
  });

  factory XServerConfiguration.fromJson(Map<String, dynamic> json) =>
      XServerConfiguration(
        defaultEnvironment: json["default-environment"],
        defaultServer: json["default-server"],
        environments: List<Environment>.from(
            json["environments"].map((x) => Environment.fromJson(x))),
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "default-environment": defaultEnvironment,
        "default-server": defaultServer,
        "environments": List<dynamic>.from(environments.map((x) => x.toJson())),
        "parameters": List<dynamic>.from(parameters.map((x) => x)),
      };
}

class Environment {
  String name;
  List<Server> servers;

  Environment({
    required this.name,
    required this.servers,
  });

  factory Environment.fromJson(Map<String, dynamic> json) => Environment(
        name: json["name"],
        servers:
            List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "servers": List<dynamic>.from(servers.map((x) => x.toJson())),
      };
}

class Server {
  String name;
  String url;

  Server({
    required this.name,
    required this.url,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum XStatus { VALIDATED }

final xStatusValues = EnumValues({"validated": XStatus.VALIDATED});

enum XTag {
  AMA_FOR_DEV,
  API,
  API_BLUEPRINT,
  API_DEFINITION,
  API_DESCRIPTIONS,
  AZURE,
  BANK_NEUTRAL,
  BBC,
  BLOG,
  BULK_SMS,
  CATALOG,
  CODE_COLLABORATION,
  CODE_REPOSITORY,
  COMICS,
  DIRECTORY,
  GIT,
  HELP_WANTED,
  HUMOR,
  I_PLAYER,
  I_PLAYER_RADIO,
  LGBT,
  MICROSOFT,
  MOBILE_SERVICES,
  OMNI_CHANNEL_REPORTING,
  ONLINE_RETAIL,
  OPEN_API,
  PARTNER,
  PAYMENTS,
  PII,
  PROGRAMME_INFORMATION,
  PUBLISHING_PLATFORM,
  QUICK_CONNECT,
  RAML,
  REST,
  SANDBOX,
  SMS,
  SOAP,
  SOCIAL_JOURNALISM,
  SWAGGER,
  TRAVEL_BOOKING,
  WADL
}

final xTagValues = EnumValues({
  "#ama-for-dev": XTag.AMA_FOR_DEV,
  "API": XTag.API,
  "API blueprint": XTag.API_BLUEPRINT,
  "API definition": XTag.API_DEFINITION,
  "API descriptions": XTag.API_DESCRIPTIONS,
  "Azure": XTag.AZURE,
  "bank-neutral": XTag.BANK_NEUTRAL,
  "BBC": XTag.BBC,
  "blog": XTag.BLOG,
  "bulk SMS": XTag.BULK_SMS,
  "Catalog": XTag.CATALOG,
  "code collaboration": XTag.CODE_COLLABORATION,
  "code repository": XTag.CODE_REPOSITORY,
  "comics": XTag.COMICS,
  "Directory": XTag.DIRECTORY,
  "git": XTag.GIT,
  "helpWanted": XTag.HELP_WANTED,
  "humor": XTag.HUMOR,
  "iPlayer": XTag.I_PLAYER,
  "iPlayer Radio": XTag.I_PLAYER_RADIO,
  "lgbt": XTag.LGBT,
  "Microsoft": XTag.MICROSOFT,
  "#mobile-services": XTag.MOBILE_SERVICES,
  "omni-channel reporting": XTag.OMNI_CHANNEL_REPORTING,
  "#online-retail": XTag.ONLINE_RETAIL,
  "OpenAPI": XTag.OPEN_API,
  "partner": XTag.PARTNER,
  "payments": XTag.PAYMENTS,
  "pii": XTag.PII,
  "programme information": XTag.PROGRAMME_INFORMATION,
  "publishing platform": XTag.PUBLISHING_PLATFORM,
  "#quick-connect": XTag.QUICK_CONNECT,
  "RAML": XTag.RAML,
  "REST": XTag.REST,
  "sandbox": XTag.SANDBOX,
  "SMS": XTag.SMS,
  "SOAP": XTag.SOAP,
  "social journalism": XTag.SOCIAL_JOURNALISM,
  "Swagger": XTag.SWAGGER,
  "#travel-booking": XTag.TRAVEL_BOOKING,
  "WADL": XTag.WADL
});

class XTestOnEnvironment {
  String environment;

  XTestOnEnvironment({
    required this.environment,
  });

  factory XTestOnEnvironment.fromJson(Map<String, dynamic> json) =>
      XTestOnEnvironment(
        environment: json["environment"],
      );

  Map<String, dynamic> toJson() => {
        "environment": environment,
      };
}

enum OpenapiVer { THE_20, THE_300, THE_301, THE_302, THE_303, THE_310 }

final openapiVerValues = EnumValues({
  "2.0": OpenapiVer.THE_20,
  "3.0.0": OpenapiVer.THE_300,
  "3.0.1": OpenapiVer.THE_301,
  "3.0.2": OpenapiVer.THE_302,
  "3.0.3": OpenapiVer.THE_303,
  "3.1.0": OpenapiVer.THE_310
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
