# VCF Merger for UK Biobank RAP
##### Developed by Andrew Wood. University of Exeter
This applet performs the merging of VCFs through [bcftools](https://samtools.github.io/bcftools/bcftools.html). If working with WGS VCFs, you should consider trimming down data that may not be required for subsequent analysis of the merged VCFs. [Here](https://github.com/drarwood/vcf_trimmer) is an applet that performs such operations.

---
#### Obtaining and installing the applet

Clone this github repo to a local directory:
```
git clone https://github.com/drarwood/vcf_merger
```

Navigate to a relevant directory within the project directory on the DNAnexus platform to install the applet
```
dx cd /path/to/install/apps 
```

Now you are ready to build and upload the applet to the DNAnexus plaform directory:
```
dx build -f vcf_merger
```
---
#### Command line usage
Navigate to the RAP directory where you want the output to be directed:
```
dx cd /path/to/where/the/output/should/go
```
Simply run the applet by specifying the name (and path if required) of the `*.vcf.gz` input VCF and the filename of the output GDS:
```
dx run /path/to/install/apps/vcf_merger \
  -ivcf_file_list=/path/to/vcf/file/list.txt \
  -imerged_vcf_filename=my_data_merged.vcf.gz \
  -y
```
See [`dx run`](https://documentation.dnanexus.com/user/helpstrings-of-sdk-command-line-utilities#run) on changing job priority etc.
