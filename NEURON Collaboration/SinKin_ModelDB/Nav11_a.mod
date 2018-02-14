TITLE Nav1.1 ionic voltage-gated channel with kinetic scheme

COMMENT
A six-state markovian kinetic model of ionic channel.
Part of a study on kinetic models.
Author: Piero Balbi, July 2016
Modified January 2017
ENDCOMMENT

NEURON {
	SUFFIX na11a
	USEION na READ ena WRITE ina
	RANGE gbar, ina, g
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	v (mV)
	ena (mV)
	celsius (degC)
	gbar  = 0.1	 (mho/cm2)

	C1O1b2	  = 18
	C1O1v2    = -7
	C1O1k2	  = -10

	O1C1b1	  = 3
	O1C1v1    = -37
	O1C1k1	  = 10
	O1C1b2	  = 18
	O1C1v2    = -7
	O1C1k2	  = -10

	O1I1b1	  = 8
	O1I1v1	  = -37
	O1I1k1	  = 13
	O1I1b2	  = 17
	O1I1v2	  = -7
	O1I1k2	  = -15

	I1O1b1	  = 0.00001
	I1O1v1	  = -37
	I1O1k1	  = 10

	I1C1b1	  = 3
	I1C1v1    = -37
	I1C1k1	  = 10
	I1C1b2	  = 18
	I1C1v2    = -7
	I1C1k2	  = -10

	C1I1b1	  = 3
	C1I1v1    = -37
	C1I1k1	  = 10
	C1I1b2	  = 18
	C1I1v2    = -7
	C1I1k2	  = -10

}

ASSIGNED {
	ina  (mA/cm2)
	g   (mho/cm2)

	C1O1_a (/ms)
	O1C1_a (/ms)
	O1I1_a (/ms)
	I1O1_a (/ms)
	I1C1_a (/ms)
	C1I1_a (/ms)

	Q10 (1)
}

STATE {
	C1
	O1
	I1
}


INITIAL {
	Q10 = 3^((celsius-20(degC))/10 (degC))
	SOLVE kin
	STEADYSTATE sparse
}

BREAKPOINT {
	SOLVE kin METHOD sparse
	g = gbar * (O1)	: (mho/cm2)
	ina = g * (v - ena)   	: (mA/cm2)
}

KINETIC kin {
	rates(v)

	~ C1 <->  O1 (C1O1_a, O1C1_a)
	~ O1 <->  I1 (O1I1_a, I1O1_a)
	~ C1 <->  I1 (C1I1_a, I1C1_a)

	CONSERVE O1 + C1 + I1 = 1
}

FUNCTION rates2(v, b, vv, k) {
	rates2 = (b/(1+exp((v-vv)/k)))
}

PROCEDURE rates(v(mV)) {
UNITSOFF
	C1O1_a = Q10*(rates2(v, C1O1b2, C1O1v2, C1O1k2))
	O1C1_a = Q10*(rates2(v, O1C1b1, O1C1v1, O1C1k1) + rates2(v, O1C1b2, O1C1v2, O1C1k2))
	O1I1_a = Q10*(rates2(v, O1I1b1, O1I1v1, O1I1k1) + rates2(v, O1I1b2, O1I1v2, O1I1k2))
	I1O1_a = Q10*(rates2(v, I1O1b1, I1O1v1, I1O1k1))
	C1I1_a = Q10*(rates2(v, C1I1b2, C1I1v2, C1I1k2))
	I1C1_a = Q10*(rates2(v, I1C1b2, I1C1v2, I1C1k2))
UNITSON
}
