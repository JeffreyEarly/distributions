function build_website_documentation(options)
arguments
    options.rootDir = ".."
end

rootDir = char(java.io.File(char(options.rootDir)).getCanonicalPath());
buildFolder = fullfile(rootDir, "docs");
sourceFolder = fullfile(rootDir, "Documentation", "WebsiteDocumentation");

if ~isfolder(sourceFolder)
    error("build_website_documentation:SourceMissing", ...
        "Could not find source documentation at %s", sourceFolder);
end

if isfolder(buildFolder)
    rmdir(buildFolder, "s");
end
copyfile(sourceFolder, buildFolder);

addPackageToPath(rootDir);

changelogPath = fullfile(rootDir, "CHANGELOG.md");
if isfile(changelogPath)
    header = "---" + newline + ...
             "layout: default" + newline + ...
             "title: Version History" + newline + ...
             "nav_order: 100" + newline + ...
             "---" + newline + newline;
    versionHistoryText = header + fileread(changelogPath);
    versionHistoryFilePath = fullfile(buildFolder, "version-history.md");
    fid = fopen(versionHistoryFilePath, "w");
    assert(fid ~= -1, "Could not open version-history.md for writing");
    fwrite(fid, versionHistoryText);
    fclose(fid);
end

evalin("base", "clear classes");
evalin("base", "rehash");

websiteRootURL = "distributions/";
classFolderName = "Class documentation";
websiteFolder = "classes";
classes = { ...
    "Distribution", ...
    "NormalDistribution", ...
    "StudentTDistribution", ...
    "RayleighDistribution", ...
    "UniformDistribution", ...
    "Chi2Distribution", ...
    "AddedDistribution", ...
    "TwoDimDistanceDistribution" ...
    };

classDocumentation = ClassDocumentation.empty(numel(classes), 0);
for iName = 1:numel(classes)
    excludedMethodNames = string.empty(0, 1);
    if classes{iName} == "Distribution"
        excludedMethodNames = "Distribution";
    end

    classDocumentation(iName) = ClassDocumentation( ...
        classes{iName}, ...
        nav_order=iName, ...
        websiteRootURL=websiteRootURL, ...
        buildFolder=buildFolder, ...
        websiteFolder=websiteFolder, ...
        parent=classFolderName, ...
        excludedMethodNames=excludedMethodNames);
end
arrayfun(@(a) a.writeToFile(), classDocumentation)

trimTrailingWhitespaceInMarkdown(buildFolder)
end

function trimTrailingWhitespaceInMarkdown(rootFolder)
markdownFiles = dir(fullfile(rootFolder, "**", "*.md"));
for iFile = 1:numel(markdownFiles)
    filePath = fullfile(markdownFiles(iFile).folder, markdownFiles(iFile).name);
    fileText = fileread(filePath);
    trimmedText = regexprep(fileText, "[ \t]+(\r?\n)", "$1");
    if ~strcmp(fileText, trimmedText)
        fid = fopen(filePath, "w");
        assert(fid ~= -1, "Could not open markdown file for writing");
        fwrite(fid, trimmedText);
        fclose(fid);
    end
end
end

function addPackageToPath(repoRoot)
addpath(repoRoot)
end
