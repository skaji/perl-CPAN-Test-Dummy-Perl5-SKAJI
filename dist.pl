my @prereq = (
    [ Prereqs => 'ConfigureRequires' ] => [
        'Module::Build::Tiny' => '0.051',
        'perl' => 'v5.24',
    ],
    [ Prereqs => 'RuntimeRequires' ] => [
        'perl' => 'v5.24',
    ],
);

my @plugin = (
    'ExecDir' => [ dir => 'script' ],
    'Git::GatherDir' => [ exclude_filename => 'META.json' ],
    'CopyFilesFromBuild' => [ copy => 'META.json', copy => 'Changes' ],
    'VersionFromMainModule' => [],
    # 'ReversionOnRelease' => [ prompt => 1 ],
    'NextRelease' => [ format => '%v  %{yyyy-MM-dd}d%{ (TRIAL RELEASE)}T' ],
    'Git::Check' => [ allow_dirty => 'Changes', allow_dirty => 'META.json' ],
    'GithubMeta' => [ issues => 1 ],
    'ReadmeAnyFromPod' => [ type => 'markdown', filename => 'README.md', location => 'root' ],
    'MetaProvides::Package' => [ inherit_version => 0, inherit_missing => 0 ],
    'PruneFiles' => [ filename => 'dist.pl', filename => 'README.md', match => '^(xt|author|maint|example|eg)/' ],
    'GitHubREADME::Badge' => [ badges => 'github_actions/test.yml' ],
    'GenerateFile' => [ filename => 'Build.PL', content => "use Module::Build::Tiny;\nBuild_PL();" ],
    'MetaJSON' => [],
    'Metadata' => [ x_static_install => 1 ],
    'Git::Contributors' => [],

    # 'CheckChangesHasContent' => [],
    # 'ConfirmRelease' => [],
    # 'UploadToCPAN' => [],
    # 'CopyFilesFromRelease' => [ match => '\.pm$' ],
    # 'Git::Commit' => [ commit_msg => '%v', allow_dirty => 'Changes', allow_dirty => 'META.json', allow_dirty_match => '\.pm$' ],
    # 'Git::Tag' => [ tag_format => '%v', tag_message => '%v' ],
    # 'Git::Push' => [],
);

my @config = (
    name => 'CPAN-Test-Dummy-Perl5-SKAJI',
    [ @prereq, @plugin ],
);
