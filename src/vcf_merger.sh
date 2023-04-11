#!/bin/bash
# vcf_merger 0.0.1
# Andrew R Wood
# University of Exeter
# No warrenty provided!
# App will run on a single machine from beginning to end.

main() {

    echo "File containing VCF file list: vcf_file_list: '$vcf_file_list'"
    echo "Name of output file: '$merged_vcf_filename'"

    # Download file with VCF list to worker
    dx download "$vcf_file_list" -o vcf_file_list

    # Download all VCFs to worker
    readarray -t arr < vcf_file_list
    for f in "${arr[@]}"
    do
        dx download $DX_PROJECT_CONTEXT_ID:"$f"
    done

    # Create new file containing the vcfs stripped of the original directory path
    awk 'BEGIN{FS="/"}{print $NF}' vcf_file_list > vcf_filenames.txt

    # Perform the concatenation
    bcftools concat --threads 16 -f vcf_filenames.txt -Oz -o merged_vcf

    # Upload the merged vcf
    merged_vcf=$(dx upload merged_vcf --brief  --path ./$merged_vcf_filename)
    dx-jobutil-add-output merged_vcf "$merged_vcf" --class=file
}

