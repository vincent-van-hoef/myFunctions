#!/bin/sh

GSEA_JAR=~/projects/myFunctions/GSEA_test/gsea-3.0.jar
RNKPATTERN=allCombo.rnk
GMT=~/projects/myFunctions/GSEA_test/MOUSE_GO_bp_no_GO_iea_symbol.gmt.txt
MAX=500
MIN=10
OUTDIR=results
PLOTNO=50

for file in *${RNKPATTERN}
do
	echo "GSEA enrichment running on ranked file: ${file}"
	java -Xmx1G -cp $GSEA_JAR xtools.gsea.GseaPreranked -gmx $GMT -rnk $file -nperm 1000 -scoring_scheme weighted -rpt_label "${file%.*}" -plot_top_x $PLOTNO -rnd_seed 12345 -set_max $MAX -make_sets true -set_min $MIN -zip_report false -out $OUTDIR > ${file%.*}.txt
done

