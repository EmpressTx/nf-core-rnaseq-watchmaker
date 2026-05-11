process COUNT_READS {
    tag "$meta.id"
    label 'process_single'

    conda "conda-forge::coreutils=9.5"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/ubuntu:20.04' :
        'biocontainers/biocontainers:v1.2.0_cv2' }"

    input:
    tuple val(meta), path(reads)

    output:
    tuple val(meta), path(reads), env(NUM_READS), emit: reads_with_count

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    # Count total number of reads across all FASTQ files for this sample
    # For paired-end, count only R1 to get the number of read pairs
    # For single-end, count all reads
    FIRST_FILE=\$(echo $reads | tr ' ' '\\n' | head -1)
    NUM_LINES=\$(zcat \$FIRST_FILE | wc -l)
    NUM_READS=\$((NUM_LINES / 4))
    """
}
