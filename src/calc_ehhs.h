#include <stdio.h>
#include <stdlib.h>

void calc_ehhs(const int* const data, const int nbr_chr, const int nbr_mrk, const int foc_mrk, const int lim_haplo,
		const double lim_ehhs, const int phased, int* const tot_nbr_chr_in_hap, double* const ehhs,
		double* const nehhs);
