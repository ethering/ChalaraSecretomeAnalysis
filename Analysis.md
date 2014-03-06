#Chalara fraxinea secretome analysis

I wanted to see which GO terms were enriched in the _Chalara fraxinea_ secretome.

The _C.fraxinea_ predicted proteins can be found [here:](https://github.com/ash-dieback-crowdsource/data/blob/master/ash_dieback/chalara_fraxinea/Kenninghall_wood_KW1/annotations/Gene_predictions/TGAC_Chalara_fraxinea_ass_s1v1_ann_v1.1/Chalara_fraxinea_ass_s1v1_ann_v1.1.protein.faa)

The _C.fraxinea_ secretome can be found [here:](https://github.com/ash-dieback-crowdsource/data/blob/master/ash_dieback/chalara_fraxinea/Kenninghall_wood_KW1/annotations/Secretome_prediction/Chalara_fraxinea_secretome.faa)

I took the protein ids along with their GO terms, which can be found in [terms_and_descriptions.json](https://github.com/danmaclean/h_pseu_analysis/blob/master/go_analysis/terms_and_descriptions.json) and using the [Chalara secretome list](https://github.com/ethering/ChalaraSecretomeAnalysis/blob/master/Chalara_secretome_list.txt) I counted how many secretome and non-secretome proteins were attributed to each GO term. I did this using the [CharalaSecretome Java code](https://github.com/ethering/CharlaraSecretomeJavaCode). The output, [go_found_notfound.txt](https://github.com/ethering/ChalaraSecretomeAnalysis/blob/master/go_found_notfound.txt) also contains the probability of finding the given number of secretome genes for that GO term (prob of combination), and the also contains the probability of finding the given number of non-secretome genes for that GO term (expected).


[secretome_phyer.R](https://github.com/ethering/ChalaraSecretomeAnalysis/blob/master/secretome_phyer.R) was then used to apply a hypergeometric test to identify the GO terms that were enriched in the secretome compared to the non-secretome. The Bonferonni corrected p-values for theses tests were written to [go_pvals.txt](https://github.com/ethering/ChalaraSecretomeAnalysis/blob/master/go_pvals.txt) and then entered into the [go_found_notfound.txt](https://github.com/ethering/ChalaraSecretomeAnalysis/blob/master/go_found_notfound.txt) output.
