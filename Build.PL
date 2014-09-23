use 5.012;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'PDF::Document',
    license             => 'perl',
    dist_author         => 'Vernon Lyon <vlyon@cpan.org>',
    dist_version_from   => 'lib/PDF/Document.pm',
    build_requires => {
        'Module::Build' => '0.30',
        'Test::More' => 0,
    },
    requires => {
        'perl' => 5.012,
    },
    add_to_cleanup      => [ 'PDF-Document-*' ],
    meta_merge => {
        resources => {
            bugtracker => 'http://rt.cpan.org/Public/Dist/Display.html?Name=PDF-Document',
            repository => 'https://github.com/vlyon/PDF-Document.git',
        },
    },
);

$builder->create_build_script;
