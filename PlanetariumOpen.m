Horizon /: Horizon::trace = ""
 
Horizon /: Horizon::usage = "Horizon is an option to the various StarChart \
commands. By default it is set to False, but if set to True it will cause the \
line of local horizon to be drawn on the chart."
 
Revs /: Revs::trace = ""
 
Revs /: Revs::usage = "Revs is the unit of revolutions. It equals 360Degree."
 
East /: East::trace = ""
 
East /: East::usage = "East is the point on the local horizon in the \
direction towards east, i.e the point with Azimuth->90*Degree, Altitude -> \
0*Degree. This object can be used in the HorizonStarChart command, but can \
also be used in other commands where it is treated as if it were a star."
 
Geo$Latitude = -37.8
 
Jupiter /: Jupiter::trace = ""
 
Jupiter /: Jupiter::usage = "Jupiter is the planet \
Jupiter.\n\tEquatorialRadius : 71,942km\n\tRotationPeriod   : 9h50m to \
9h55m\n\tRotationAxisTilt : 3.07 Degree\n\tOblateness       : \
0.063\n\tOrbitalSemiMajorAxis : 5.202803 AU\n\tOrbitalPeriod        : 11.862 \
Year\n\tOrbitalInclination   : 1.30 Degree\n\tOrbitalEccentricity  : 0.0485"
 
ConjunctionP /: ConjunctionP::usage = "ConjunctionP[object1, object2, neardate] \
returns the date, nearest to neardate, at which object1 (a planet or a star) \
will align with object2. Only the Ascension coordinate is aligned, and not \
Declination. If date is omitted the current Date[] is used."
 
GeoLatitude /: GeoLatitude::trace = ""
 
GeoLatitude /: GeoLatitude::usage = "GeoLatitude is an option for SetLocation \
which specifies the geographic latitude of the viewing location. For a \
latitude of -37.8 degrees, use GeoLatitude -> -37.8*Degree "
 
Saturn /: Saturn::trace = ""
 
Saturn /: Saturn::usage = "Saturn is the planet Saturn.\n\tEquatorialRadius : \
60,268km\n\tRotationPeriod   : 10h14m to 10h38m\n\tRotationAxisTilt : 26.73 \
Degree\n\tOblateness       : 0.098\n\tOrbitalSemiMajorAxis : 9.53884 \
AU\n\tOrbitalPeriod        : 29.456 Year\n\tOrbitalInclination   : 2.49 \
Degree\n\tOrbitalEccentricity  : 0.0556"
 
EclipseEnd[___] := (Message[EclipseEnd::noavail, EclipseEnd]; )
 
EclipseEnd /: EclipseEnd::noavail = 
     "This is just the demo version, and `1` is not available."
 
EclipseEnd /: EclipseEnd::usage = "EclipseEnd[object1, object2, object3, \
neardate] returns the precise date, near the neardate, at which object1 will \
just cease to be eclipsed by object2 from the light from object3. The object3 \
is treated as a point source, but the diameters of object1 and object2 are \
taken into account. The command effectively tests for the ending of a \
*partial* eclipse. If object3 is omitted then the Sun is used. If object2 is \
omitted then the Earth is used (unless object1 is itself the Earth in which \
case the Moon is used). Thus EclipseEnd[Mir, neardate] will return the \
precise time at which the object Mir will begin to be illuminated by the Sun, \
because it leaves the Earth's shadow. If date is omitted the current Date[] \
is used."
 
Sun /: Sun::trace = ""
 
Sun /: Sun::usage = "Sun is the Sun. It's the big yellow thing in the daytime \
sky.\n\tEquatorialRadius : 696,000km\n\tRotationPeriod   : 25.4days to \
34days\n\tRotationAxisTilt : 7.2 Degree\n\tOblateness       : 0.00"
 
PtolemyChart[___] := (Message[PtolemyChart::noavail, PtolemyChart]; )
 
PtolemyChart /: PtolemyChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
PtolemyChart /: PtolemyChart::usage = "PtolemyChart[baseyear] produces a \
graphics showing the universe according to Ptolemy. The Earth is the centre \
of the universe and the planets, the Sun and stars are shown orbiting it in \
concentric circles. In the graphic, big dots represent the start (Jan 1) of a \
new year starting with the baseyear, and the smaller dots represent months \
within that year. The smaller month dots can sometimes clump together when \
the planet is undergoing retrograde motion. The outer ring shows the position \
of the Sun, even though Ptolemy would have placed the Sun in the third ring. \
Mercury and Venus are always quite close to the Sun, so their positions are \
shown only for the next 5 and 8 years respectively after the baseyear. The \
positions of Mars and Jupiter are shown for the next 15 and 11 years \
respectively, and Saturn for the next 28 years. The outermost ring shows the \
fixed stars along the ecliptic. If baseyear is omitted the current year is \
used. The graphic produced by PtolemyChart is only suitable for printing on \
say a laserprinter. It is not intended to be readable on the screen."
 
Nadir /: Nadir::trace = ""
 
Nadir /: Nadir::usage = "Nadir is the point in the direction directly below \
your feet, ie. the point with Altitude -> -90*Degree. This object can be used \
as if it were a star."
 
PenumbraDiameter /: PenumbraDiameter::trace = ""
 
PenumbraDiameter /: PenumbraDiameter::usage = "PenumbraDiameter is a name \
used by EarthShadow that represents the angular diameter of the partial \
shadow of the Earth projected at the distance of the Moon."
 
Europa /: Europa::trace = ""
 
Europa /: Europa::usage = "Europa is the second Galilean moon orbiting \
Jupiter.\n\tEquatorialRadius : 1,569km\n\tRotationPeriod   : \
3.551days\n\tRotationAxisTilt : ??? Degree\n\tOblateness       : \
0.00\n\tOrbitalSemiMajorAxis : 9.40 * 71,942km\n\tOrbitalPeriod        : \
3.55118108days\n\tOrbitalInclination   : 3.57 Degree\n\tOrbitalEccentricity  \
: 0.0003"
 
true$anomaly = CompiledFunction[{8, 8., 5468}, 
     {_Real, _Real}, {{3, 0, 0}, {3, 0, 1}, {3, 0, 11}}, 
     {{3.141592653589793, {3, 0, 12}}, {7., {3, 0, 9}}, {1.*^-7, {3, 0, 10}}, 
      {0.9, {3, 0, 8}}, {1., {3, 0, 5}}, {2., {3, 0, 13}}, {0.5, {3, 0, 14}}, 
      {2, {2, 0, 0}}, {0.017453292519943295, {3, 0, 2}}}, {2, 1, 15, 0, 0}, 
     {{16, 0, 2, 3}, {40, 1, 3, 0, 3, 3, 0, 4}, {40, 2, 3, 0, 3, 3, 0, 6}, 
      {16, 1, 6, 7}, {19, 7, 6}, {13, 5, 6, 7}, {40, 58, 3, 0, 7, 3, 0, 6}, 
      {16, 1, 4, 6, 7}, {13, 3, 7, 4}, {7, 4, 3}, {27, 3, 9, 1, 8, 0}, 
      {2, 0, 20}, {40, 38, 3, 0, 7, 3, 0, 4}, {27, 6, 9, 4, 10, 1}, 
      {2, 1, 16}, {40, 1, 3, 0, 3, 3, 0, 4}, {16, 1, 4, 6}, {19, 3, 4}, 
      {16, 0, 2, 11}, {13, 6, 4, 11, 6}, {40, 2, 3, 0, 3, 3, 0, 4}, 
      {16, 1, 4, 11}, {19, 11, 4}, {13, 5, 4, 11}, {40, 58, 3, 0, 11, 3, 0, 
       4}, {16, 6, 4, 6}, {7, 6, 7}, {13, 3, 7, 6}, {7, 6, 3}, {3, -17}, 
      {3, 22}, {40, 38, 3, 0, 7, 3, 0, 6}, {27, 6, 9, 6, 10, 1}, {2, 1, 19}, 
      {40, 1, 3, 0, 3, 3, 0, 6}, {16, 1, 6, 4}, {19, 3, 6}, {16, 0, 2, 11}, 
      {13, 4, 6, 11, 4}, {40, 2, 3, 0, 3, 3, 0, 6}, {16, 1, 6, 11}, 
      {19, 11, 6}, {13, 5, 6, 11}, {40, 58, 3, 0, 11, 3, 0, 6}, 
      {16, 4, 6, 4}, {7, 4, 7}, {13, 3, 7, 4}, {10, 0, 11}, {16, 11, 12, 11}, 
      {41, 261, 3, 0, 4, 3, 0, 11, 3, 0, 6}, {7, 6, 3}, {3, -20}, 
      {13, 5, 1, 4}, {19, 1, 11}, {13, 5, 11, 6}, {40, 58, 3, 0, 6, 3, 0, 
       11}, {16, 4, 11, 4}, {40, 57, 3, 0, 4, 3, 0, 11}, {16, 14, 3, 6}, 
      {40, 3, 3, 0, 6, 3, 0, 4}, {16, 11, 4, 11}, {40, 19, 3, 0, 11, 3, 0, 
       4}, {16, 13, 4, 11}, {1}}, Function[{meananomaly, 
       eccentricity}, Block[{a, 
        error}, a = 
         meananomaly*N[Degree]; 
        error = (eccentricity*
           Sin[a])/(1. - eccentricity*
            Cos[a]); a += 
         error; If[eccentricity < 
          0.9, While[Abs[error] >= 1.*^-7, 
          error = (eccentricity*Sin[
                a] - a + 
              meananomaly*N[Degree])/
             (1. - eccentricity*Cos[
                a]); a += 
            error], 
         While[Abs[error] >= 1.*^-7, 
          error = (eccentricity*Sin[
                a] - a + 
              meananomaly*N[Degree])/
             (1. - eccentricity*Cos[
                a]); a = 
            Mod[a + error, 
             N[2*Pi]]]]; 
        2.*ArcTan[Sqrt[(1. + eccentricity)/
             (1. - eccentricity)]*
           Tan[0.5*a]]]], Evaluate]
 
South /: South::trace = ""
 
South /: South::usage = "South is the point on the local horizon in the \
direction towards south, i.e the point with Azimuth->180*Degree, Altitude -> \
0*Degree. This object can be used in the HorizonStarChart command, but can \
also be used in other commands where it is treated as if it were a star."
 
ApparentMagnitude /: ApparentMagnitude::trace = ""
 
ApparentMagnitude /: ApparentMagnitude::usage = 
     "ApparentMagnitude is a value returned by the AppearanceP command."
 
e2hCoordinates[hcoords:
      {___, Altitude -> _, ___}, ___] := hcoords
 
e2hCoordinates[{ecoords___Rule}, 
     day:_Real | _Integer, 
     opts___Rule] := 
    Block[{asc, dec, 
      distance, ha, 
      sx, cx, sy, 
      cy, az, 
      alt, azimuth, 
      altitude}, 
     {asc, dec, 
        distance} = 
       N[{Ascension, Declination, Distance} /. 
         {ecoords}]; epoch = 
       Epoch /. {opts} /. Epoch -> Automatic; 
      If[NumberQ[epoch], 
       {asc, dec} = 
        epochChange[(epoch - 1900.)*
           365.2425, N[{asc/Hour, dec/
             Degree}], day]*N[{Hour, Degree}]]; 
      ha = N[asc - 
         (Geo$Longitude + 360*(day - 
             Floor[day]) + 
           SolarMeanLongitude[day] - 
           180)*Degree]; sx = 
       Sin[ha]; cx = 
       Cos[ha]; sy = 
       Sin[dec]; cy = 
       Cos[dec]; alt = 
       ArcSin[sy*Sin$Geo$Latitude + 
         cy*cx*
          Cos$Geo$Latitude]; 
      altitude = N[alt/Degree]; 
      If[Chop[Abs[altitude] - 90] === 0, 
       azimuth = 0., az = 
         ArcTan[-(cy*cx*
             Sin$Geo$Latitude) + sy*
            Cos$Geo$Latitude, cy*
           sx]; azimuth = 
         Mod[az/N[Degree], 360]]; 
      If[distance =!= Distance, 
       {Azimuth -> azimuth*Degree, 
        Altitude -> altitude*Degree, 
        Distance -> distance}, 
       {Azimuth -> azimuth*Degree, 
        Altitude -> altitude*Degree}]]
 
e2hCoordinates /: 
    e2hCoordinates::trace = ""
 
Altitude /: Altitude::trace = ""
 
Altitude /: Altitude::usage = "Altitude is the name of Altitude used by \
HorizonCoordinates. It measures in degrees the angle above the Horizon."
 
Ascension /: Ascension::trace = ""
 
Ascension /: Ascension::usage = "Ascension is the name of Right Ascension \
used by EquatorCoordinates. It measures in hours the angle around the \
Celestial Equator."
 
Declination /: Declination::trace = ""
 
Declination /: Declination::usage = "Declination is the name of Declination \
used by EquatorCoordinates. It measures in degrees the angle above the \
Celestial Equator."
 
Distance /: Distance::trace = ""
 
Distance /: Distance::usage = "Distance is a name used by EquatorCoordinates \
and HorizonCoordinates. It measures in AU (Astronomical Units) the distance \
from the ViewPoint."
 
Epoch /: Epoch::trace = ""
 
Epoch /: Epoch::usage = "Epoch is an option for the EquatorCoordinates and \
Ephemeris commands. The default is Epoch->Automatic which specifies the \
current Epoch for the plane of the Earth's Equator. Use say Epoch->2000.0 to \
have Ascension and Declination returned relative to the equator at Epoch year \
2000.0."
 
epochChange[d1_, 
     {ra1_, dec1_}, 
     d2_] := Block[{dy, 
      dt, m, n, 
      ra2, dec2}, 
     dy = (d2 - 
         d1)/365.2425; dt = 
       (d2 + d1)/(36525.*2); 
      m = ((46.0851 + 0.0279*dt)*
         dy)/(60*60); n = 
       ((20.0468 - 0.0085*dt)*dy)/
        (60*60); ra2 = Mod[ra1 + 
         (m + n*
            Sin[15*ra1*N[Degree]]*
            Tan[dec1*N[Degree]])/15, 24]; 
      dec2 = Mod[dec1 + 
          n*Cos[15*ra1*N[Degree]] + 
          180, 360] - 180; If[dec2 > 90, 
       dec2 = 180 - dec2; 
        ra2 = Mod[ra2 - 12, 24]]; 
      If[dec2 < -90, dec2 = 
         -180 - dec2; ra2 = 
         Mod[ra2 - 12, 24]]; 
      If[Chop[Abs[dec2] - 90] === 0, 
       ra2 = 0]; Return[{ra2, 
        dec2}]]
 
epochChange /: epochChange::trace = ""
 
N[Hour, n_:15.954589770191003] := 
    N[Pi/12, n]
 
Hour /: Hour::trace = ""
 
Hour /: Hour::usage = "Hour gives the number of radians in one hour of Right \
Ascension. It has the numerical value Pi/12."
 
Geo$Longitude = 145.
 
SolarMeanLongitude[d_] := 
    Block[{T = d/36525.}, 
     Mod[279.20385 + 0.9856473354*d + 0.0003025*T^2, 360]]
 
SolarMeanLongitude /: 
    SolarMeanLongitude::trace = ""
 
Sin$Geo$Latitude = -0.6129070536529764
 
Cos$Geo$Latitude = 0.7901550123756904
 
Azimuth /: Azimuth::trace = ""
 
Azimuth /: Azimuth::usage = "Azimuth is the name of Azimuth used by \
HorizonCoordinates. It measures in degrees the compass angle around the \
Horizon."
 
SetLocation[opts:(_Rule | _RuleDelayed)...] := 
    Block[{defaults, v1, 
      v2, v3, v4, 
      refr}, v1 = 11; 
      v2 = 145.; v3 = -37.8; 
      v4 = 0.; GMT$diff = 
       v1; Geo$Longitude = 
       Mod[v2 + 180, 360] - 180 /. 0 -> 0.; 
      Geo$Latitude = v3 /. 0 -> 0.; 
      Geo$Altitude = v4 /. 0 -> 0.; 
      If[Chop[Abs[Geo$Latitude] - 90] === 0, 
       Geo$Longitude = 0.]; 
      Sin$Geo$Latitude = 
       Sin[N[Geo$Latitude*Degree]]; 
      Cos$Geo$Latitude = 
       Cos[N[Geo$Latitude*Degree]]; 
      Tan$Geo$Latitude = 
       Tan[N[Geo$Latitude*Degree]]; 
      Epoch$1900 = -86400. + GMT$diff*
         60.*60.; Topo$x$y$z = 
       Geod[Geo$Longitude, 
         Geo$Latitude, Geo$Altitude]/
        1.495979*^8; If[Cos$Geo$Latitude < 
        10*$MachineEpsilon, Cos$Geo$Latitude = 
        10*$MachineEpsilon]; refr = 
       (34 + 1.925*Sqrt[1000.*Geo$Altitude])/900; 
      Geo$Refract = refr/
        Cos$Geo$Latitude; 
      dLastSolarLongitudeP = Null; 
      dLastEarthxyz = Null; 
      dLastTopoxyz = Null; 
      dateLastDAY = Null; 
      {GeoLongitude -> Geo$Longitude*Degree, 
       GeoLatitude -> Geo$Latitude*Degree, 
       GeoAltitude -> Geo$Altitude*KiloMeter, 
       TimeZone -> GMT$diff}]
 
Options[SetLocation] = {GeoLongitude -> Automatic, GeoLatitude -> 0., 
     GeoAltitude -> 0., TimeZone :> TimeZone[]}
 
SetLocation /: SetLocation::nn = "Value of `1` is not numeric."
 
SetLocation /: SetLocation::trace = ""
 
SetLocation /: SetLocation::usage = "SetLocation[] sets the GeoLongitude, \
GeoLatitude, GeoAltitude and TimeZone of your location on Earth. For example, \
for Melbourne Australia use: SetLocation[GeoLongitude -> 145.0 Degree, \
GeoLatitude -> -37.8 Degree];"
 
GMT$diff = 11
 
Geo$Altitude = 0.
 
Tan$Geo$Latitude = -0.775679511049613
 
Epoch$1900 = -46800.
 
Topo$x$y$z = {-0.00002756225567570074, 
     0.000019299299194189006, -0.000026099522249876014}
 
Geod[longitude_, 
     latitude_] := Geod[
     longitude, latitude, 0.]
 
Geod[longitude_, 
     latitude_, altitude_] := 
    Block[{cosLong, sinLong, 
      cosLat, sinLat, 
      sinLat2, EarthRadius}, 
     cosLong = Cos[longitude*
         N[Degree]]; sinLong = 
       Sin[longitude*N[Degree]]; 
      cosLat = Cos[latitude*
         N[Degree]]; sinLat = 
       Sin[latitude*N[Degree]]; 
      sinLat2 = Sin[2*latitude*
         N[Degree]]; EarthRadius = 
       6378.387 - 21.494*sinLat^2 + 
        0.042*sinLat2^2; 
      (EarthRadius + altitude)*
       {cosLong*cosLat, 
        sinLong*cosLat, 
        sinLat}]
 
Geod /: Geod::trace = ""
 
Geo$Refract = 0.0478105905627234
 
dLastSolarLongitudeP = Null
 
dLastEarthxyz = Null
 
dLastTopoxyz = Null
 
dateLastDAY = Null
 
GeoLongitude /: GeoLongitude::trace = ""
 
GeoLongitude /: GeoLongitude::usage = "GeoLongitude is an option for \
SetLocation which specifies the geographic longitude of the viewing location. \
For a longitude of 145.0 degrees, use GeoLongitude -> 145.0*Degree "
 
GeoAltitude /: GeoAltitude::trace = ""
 
GeoAltitude /: GeoAltitude::usage = "GeoAltitude is an option for SetLocation \
which specifies the geographic altitude of the viewing location. For an \
altitude of 300 metres, use GeoAltitude -> 0.300*KiloMeter "
 
KiloMeter /: KiloMeter::trace = ""
 
KiloMeter /: KiloMeter::usage = "KiloMeter is a unit of distance."
 
JfeatureLongitude = CompiledFunction[{8, 8., 5468}, 
     {_Real, _Real}, {{3, 0, 0}, {3, 0, 1}, {3, 0, 33}}, 
     {{221.647, {3, 0, 4}}, {0.9025179, {3, 0, 5}}, {187.66, {3, 0, 31}}, 
      {0.01672, {3, 0, 18}}, {225.32833, {3, 0, 12}}, {360., {3, 0, 36}}, 
      {0.9856003, {3, 0, 10}}, {0.25192, {3, 0, 23}}, 
      {0.00577167643528, {3, 0, 29}}, {-0.5, {3, 0, 2}}, 
      {5.20867, {3, 0, 22}}, {5.552, {3, 0, 20}}, {-180., {3, 0, 37}}, 
      {1.916, {3, 0, 15}}, {2, {2, 0, 0}}, {870.1869088, {3, 0, 32}}, 
      {358.47583, {3, 0, 9}}, {1, {2, 0, 1}}, {-36525, {2, 0, 2}}, 
      {1.00014, {3, 0, 17}}, {0.017453292519943295, {3, 0, 8}}, 
      {0.0830853, {3, 0, 13}}, {180., {3, 0, 34}}}, {0, 3, 38, 0, 0}, 
     {{13, 1, 2, 3}, {16, 5, 3, 6}, {13, 4, 6, 7}, {16, 7, 8, 7}, 
      {16, 10, 3, 6}, {13, 9, 6, 11}, {16, 11, 8, 11}, {16, 13, 3, 6}, 
      {13, 12, 6, 14}, {16, 14, 8, 14}, {40, 1, 3, 0, 11, 3, 0, 6}, 
      {16, 15, 6, 8, 16}, {40, 2, 3, 0, 11, 3, 0, 6}, {16, 18, 6, 19}, 
      {19, 19, 6}, {13, 17, 6, 19}, {40, 1, 3, 0, 14, 3, 0, 6}, 
      {16, 20, 6, 8, 21}, {40, 2, 3, 0, 14, 3, 0, 6}, {16, 23, 6, 24}, 
      {19, 24, 6}, {13, 22, 6, 24}, {19, 21, 6}, {13, 7, 16, 6, 25}, 
      {16, 19, 19, 6}, {16, 24, 24, 26}, {40, 2, 3, 0, 25, 3, 0, 27}, 
      {10, 0, 28}, {16, 28, 19, 24, 27, 28}, {19, 28, 27}, 
      {13, 6, 26, 27, 6}, {40, 57, 3, 0, 6, 3, 0, 26}, 
      {40, 58, 3, 0, 26, 3, 0, 6}, {40, 1, 3, 0, 25, 3, 0, 27}, 
      {16, 19, 6, 27, 28}, {40, 56, 3, 0, 28, 3, 0, 6}, {19, 6, 27}, 
      {10, 1, 6}, {13, 6, 27, 6}, {40, 57, 3, 0, 6, 3, 0, 27}, 
      {40, 58, 3, 0, 27, 3, 0, 6}, {16, 28, 6, 27}, {40, 19, 3, 0, 27, 3, 0, 
       6}, {19, 21, 27}, {13, 6, 27, 6}, {40, 58, 3, 0, 8, 3, 0, 27}, 
      {16, 6, 27, 6}, {16, 29, 26, 27}, {19, 27, 30}, {13, 3, 30, 27}, 
      {10, 2, 30}, {13, 27, 30, 33}, {16, 32, 33, 30}, {19, 0, 33}, 
      {13, 31, 30, 6, 33, 34, 35}, {41, 261, 3, 0, 35, 3, 0, 36, 3, 0, 33}, 
      {13, 33, 37, 33}, {1}}, Function[{featureLong, 
       day}, Block[{d1, 
        f1, d, 
        MM, NN, 
        J, A, B, K, 
        RE, RJ, Delta, 
        spsi}, d = 
         day - 0.5; J = 
         (221.647 + 0.9025179*d)*N[Degree]; 
        MM = (358.47583 + 0.9856003*
            d)*N[Degree]; NN = 
         (225.32833 + 0.0830853*d)*N[Degree]; 
        A = 1.916*Sin[MM]*N[Degree]; 
        RE = 1.00014 - 0.01672*
           Cos[MM]; B = 
         5.552*Sin[NN]*N[Degree]; 
        RJ = 5.20867 - 0.25192*
           Cos[NN]; K = J + A - 
          B; Delta = Sqrt[RE*
            RE + RJ*
            RJ - 2*RE*
            RJ*Cos[K]]; spsi = 
         (RE*Sin[K])/Delta; f1 = 
         (ArcTan[spsi/Sqrt[1 - spsi^
                2]] - B)/N[Degree]; 
        d1 = d - 
          0.00577167643528*Delta; 
        Mod[187.66 + 870.1869088*(d1 - 36525) + 
           f1 - featureLong + 180., 
          360.] - 180.]], Evaluate]
 
gethet[md_] := 
    Block[{e, s, 
      sm, et, ss, 
      td, h, 
      refract}, e = 
       EarthTilt[md]*N[Degree]; 
      s = SolarLongitudeP[
         md]*N[Degree]; sm = 
       SolarMeanLongitude[md]; 
      ss = Sin[e]*
        Sin[s]; td = 
       (ss*Tan$Geo$Latitude)/
        Sqrt[1 - ss^2]; If[td > 1, 
       Return[{0, 0}]]; If[td < -1, Return[{12, 0}]]; 
      h = N[(ArcCos[td]*12)/Pi] - 
        Geo$Refract; et = 
       Mod[ArcTan[Cos[s], Cos[e]*
             Sin[s]]/N[Degree] - sm, 
         360]/360; If[et > 0.5, et += 
        -1.]; Return[{h, et}]]
 
gethet /: gethet::trace = ""
 
EarthTilt[d_] := 
    Block[{T = d/36525.}, 
     23.452294 + T*(-0.0130125 + T*(-1.64*^-6 + T*5.03*^-7))]
 
EarthTilt /: EarthTilt::trace = ""
 
SolarLongitudeP[d_] := 
    LastSolarLongitudeP /; d === 
      dLastSolarLongitudeP
 
SolarLongitudeP[d_] := 
    Block[{T = d/36525., 
      Solar$Perigee, Solar$Anomaly, 
      Solar$Eccentricity, theta}, 
     Solar$Perigee = 281.22081 + 
        T*(1.719173 + T*(0.000453 + T*3.*^-6)); 
      Solar$Anomaly = 
       SolarMeanLongitude[d] - 
        Solar$Perigee; 
      Solar$Eccentricity = 0.01675104 - 
        T*(0.0000418 + T*1.26*^-7); theta = 
       true$anomaly[Solar$Anomaly, 
        Solar$Eccentricity]; 
      dLastSolarLongitudeP = d; 
      LastSolarLongitudeP = 
       Mod[theta/N[Degree] + 
         Solar$Perigee, 360]]
 
SolarLongitudeP /: 
    SolarLongitudeP::trace = ""
 
MoonRise[___] := (Message[MoonRise::noavail, MoonRise]; )
 
MoonRise /: MoonRise::noavail = 
     "This is just the demo version, and `1` is not available."
 
MoonRise /: MoonRise::usage = "MoonRise[neardate] computes the precise time \
of the Moon rise on the day of the given neardate. If neardate is omitted the \
current Date[] is used."
 
Phase /: Phase::trace = ""
 
Phase /: Phase::usage = "Phase is a value returned by the AppearanceP command."
 
FullMoonP[___] := (Message[FullMoonP::noavail, FullMoonP]; )
 
FullMoonP /: FullMoonP::noavail = 
     "This is just the demo version, and `1` is not available."
 
FullMoonP /: FullMoonP::usage = "FullMoonP[neardate] computes the precise date \
of the Full Moon closest to neardate. If neardate is omitted the current \
Date[] is used."
 
MeanMagnitude[Callisto] = 6.2
 
MeanMagnitude[Ceres] = 7.5
 
MeanMagnitude[Earth] = -1.
 
MeanMagnitude[Europa] = 5.6000000000000005
 
MeanMagnitude[Ganymede] = 5.
 
MeanMagnitude[Io] = 5.4
 
MeanMagnitude[Jupiter] = -2.1
 
MeanMagnitude[Mars] = 0.7999999999999999
 
MeanMagnitude[Mercury] = -3.1
 
MeanMagnitude[Moon] = -12.2
 
MeanMagnitude[Neptune] = 7.8999999999999995
 
MeanMagnitude[Pallas] = 8.
 
MeanMagnitude[Pluto] = 14.2
 
MeanMagnitude[Saturn] = 0.8
 
MeanMagnitude[Sun] = -26.6
 
MeanMagnitude[Uranus] = 5.7
 
MeanMagnitude[Venus] = -5.1
 
MeanMagnitude[Vesta] = 6.5
 
MeanMagnitude[planet_] := 1000.
 
MeanMagnitude /: 
    MeanMagnitude::trace = ""
 
Callisto /: Callisto::trace = ""
 
Callisto /: Callisto::usage = "Callisto is the fourth Galilean moon orbiting \
Jupiter.\n\tEquatorialRadius : 2,403km\n\tRotationPeriod   : \
16.689days\n\tRotationAxisTilt : ??? Degree\n\tOblateness       : \
0.00\n\tOrbitalSemiMajorAxis : 26.36 * 71,942km\n\tOrbitalPeriod        : \
16.68901802days\n\tOrbitalInclination   : 3.97 Degree\n\tOrbitalEccentricity  \
: 0.0075"
 
Mercury /: Mercury::trace = ""
 
Mercury /: Mercury::usage = "Mercury is the planet \
Mercury.\n\tEquatorialRadius : 2,439km\n\tRotationPeriod   : \
58.646days\n\tRotationAxisTilt : 2 Degree\n\tOblateness       : \
0.00\n\tOrbitalSemiMajorAxis : 0.38709860 AU\n\tOrbitalPeriod        : \
0.24084 Year\n\tOrbitalInclination   : 7.003 Degree\n\tOrbitalEccentricity  : \
0.2056"
 
Ceres /: Ceres::trace = ""
 
Ceres /: Ceres::usage = "Ceres is the asteroid Ceres.\n\tEquatorialRadius : \
470km\n\tRotationPeriod   : 9h05m\n\tRotationAxisTilt : ??? \
Degree\n\tOblateness       : 0.0\n\tOrbitalSemiMajorAxis : 2.7674 \
AU\n\tOrbitalPeriod        : 4.6030 Year\n\tOrbitalInclination   : 10.6 \
Degree\n\tOrbitalEccentricity  : 0.0766"
 
Neptune /: Neptune::trace = ""
 
Neptune /: Neptune::usage = "Neptune is the planet \
Neptune.\n\tEquatorialRadius : 25,269km\n\tRotationPeriod   : \
16h07m\n\tRotationAxisTilt : 28.80 Degree\n\tOblateness       : \
0.02\n\tOrbitalSemiMajorAxis : 30.0578 AU\n\tOrbitalPeriod        : 164.81 \
Year\n\tOrbitalInclination   : 1.77 Degree\n\tOrbitalEccentricity  : 0.0086"
 
Pallas /: Pallas::trace = ""
 
Pallas /: Pallas::usage = "Pallas is the asteroid Pallas.\n\tEquatorialRadius \
: 290km\n\tRotationPeriod   : 7h49m\n\tRotationAxisTilt : ??? \
Degree\n\tOblateness       : 0.19\n\tOrbitalSemiMajorAxis : 2.7718 \
AU\n\tOrbitalPeriod        : 4.6111 Year\n\tOrbitalInclination   : 34.81 \
Degree\n\tOrbitalEccentricity  : 0.2346"
 
Pluto /: Pluto::trace = ""
 
Pluto /: Pluto::usage = "Pluto is the planet Pluto. Pluto is really a binary \
planet with a partner named Charon.\n\tEquatorialRadius : \
1,162km\n\tRotationPeriod   : 6.387days\n\tRotationAxisTilt : 122.5 Degree \
(Sideways)\n\tOblateness       : ???\n\tOrbitalSemiMajorAxis : 39.8151 \
AU\n\tOrbitalPeriod        : 248.53 Year\n\tOrbitalInclination   : 17.13 \
Degree\n\tOrbitalEccentricity  : 0.25515"
 
Vesta /: Vesta::trace = ""
 
Vesta /: Vesta::usage = "Vesta is the asteroid Vesta.\n\tEquatorialRadius : \
288km\n\tRotationPeriod   : 5h20m\n\tRotationAxisTilt : ??? \
Degree\n\tOblateness       : 0.0\n\tOrbitalSemiMajorAxis : 2.3617 \
AU\n\tOrbitalPeriod        : 3.6291 Year\n\tOrbitalInclination   : 7.13 \
Degree\n\tOrbitalEccentricity  : 0.0896"
 
Uranus /: Uranus::trace = ""
 
Uranus /: Uranus::usage = "Uranus is the planet Uranus.\n\tEquatorialRadius : \
25,559km\n\tRotationPeriod   : -17h14m (Retrograde)\n\tRotationAxisTilt : \
97.92 Degree (Sideways)\n\tOblateness       : 0.01\n\tOrbitalSemiMajorAxis : \
19.1819 AU\n\tOrbitalPeriod        : 84.07 Year\n\tOrbitalInclination   : \
0.77 Degree\n\tOrbitalEccentricity  : 0.0472"
 
Mars /: Mars::trace = ""
 
Mars /: Mars::usage = "Mars is the planet Mars.\n\tEquatorialRadius : \
3,397.2km\n\tRotationPeriod   : 24h37m22.6s\n\tRotationAxisTilt : 23.98 \
Degree\n\tOblateness       : 0.009\n\tOrbitalSemiMajorAxis : 1.52368840 \
AU\n\tOrbitalPeriod        : 1.8808 Year\n\tOrbitalInclination   : 1.850 \
Degree\n\tOrbitalEccentricity  : 0.09331"
 
Venus /: Venus::trace = ""
 
Venus /: Venus::usage = "Venus is the planet Venus.\n\tEquatorialRadius : \
6,052km\n\tRotationPeriod   : -243.16days (Retrograde)\n\tRotationAxisTilt : \
178 Degree (UpsideDown)\n\tOblateness       : 0.00\n\tOrbitalSemiMajorAxis : \
0.72333162 AU\n\tOrbitalPeriod        : 0.61515 Year\n\tOrbitalInclination   \
: 3.394 Degree\n\tOrbitalEccentricity  : 0.00682"
 
Ganymede /: Ganymede::trace = ""
 
Ganymede /: Ganymede::usage = "Ganymede is the third Galilean moon orbiting \
Jupiter.\n\tEquatorialRadius : 2,631km\n\tRotationPeriod   : \
7.155days\n\tRotationAxisTilt : ??? Degree\n\tOblateness       : \
0.00\n\tOrbitalSemiMajorAxis : 14.99 * 71,942km\n\tOrbitalPeriod        : \
7.15455312days\n\tOrbitalInclination   : 3.22 Degree\n\tOrbitalEccentricity  \
: 0.0015"
 
Io /: Io::trace = ""
 
Io /: Io::usage = "Io is the first Galilean moon orbiting \
Jupiter.\n\tEquatorialRadius : 1,815km\n\tRotationPeriod   : \
1.769days\n\tRotationAxisTilt : ??? Degree\n\tOblateness       : \
0.008\n\tOrbitalSemiMajorAxis : 5.91 * 71,942km\n\tOrbitalPeriod        : \
1.76913780days\n\tOrbitalInclination   : 3.14 Degree\n\tOrbitalEccentricity  \
: 0.0000"
 
Moon /: Moon::trace = ""
 
Moon /: Moon::usage = "Moon is the Moon orbiting the \
Earth.\n\tEquatorialRadius : 1,738.3km\n\tRotationPeriod   : \
27.321days\n\tRotationAxisTilt : 6.68 Degree\n\tOblateness       : \
0.002\n\tOrbitalSemiMajorAxis : 384,401.6km\n\tOrbitalPeriod        : \
27.32158214days\n\tOrbitalInclination   : 5.1453964 \
Degree\n\tOrbitalEccentricity  : 0.054900489"
 
Earth /: Earth::trace = ""
 
Earth /: Earth::usage = "Earth is the planet Earth.\n\tEquatorialRadius : \
6,378.387km\n\tRotationPeriod   : 23h56m04.1s\n\tRotationAxisTilt : 23.45 \
Degree\n\tOblateness       : 0.0034\n\tOrbitalSemiMajorAxis : 1.00000023 \
AU\n\tOrbitalPeriod        : 1.00004 Year\n\tOrbitalInclination   : 0 \
Degree\n\tOrbitalEccentricity  : 0.01675"
 
GetLocation[] := {GeoLongitude -> Geo$Longitude*Degree, 
     GeoLatitude -> Geo$Latitude*Degree, 
     GeoAltitude -> Geo$Altitude*KiloMeter, 
     TimeZone -> GMT$diff}
 
GetLocation[object_, opts___Rule] := 
    GetLocation[object, Date[], opts]
 
GetLocation[object_, datum_List, 
     opts___Rule] := 
    GetLocation[object, ModifiedJulianDay[
      datum], opts]
 
GetLocation[object_, day:
      _Real | _Integer, opts___Rule] := 
    Block[{longitude, latitude, 
      distance, sinLat, 
      sinLat2, r}, 
     {longitude, latitude, 
        distance} = 
       {(15*Ascension)/Hour - SolarMeanLongitude[
           day] - 360*(day - 
            Floor[day]) - 180, Declination, Distance} /. 
        EquatorCoordinates[object, 
         day, ViewPoint -> Earth]; 
      sinLat = Sin[N[latitude]]; 
      sinLat2 = Sin[N[2*latitude]]; 
      r = 6378.387 - 21.494*sinLat^
          2 + 0.042*sinLat2^2; 
      {GeoLongitude -> (Mod[longitude + 180, 360] - 180)*
         Degree, GeoLatitude -> latitude, 
       GeoAltitude -> ((distance*149597900)/AU - 
          r)*KiloMeter}]
 
GetLocation /: GetLocation::trace = ""
 
GetLocation /: GetLocation::usage = "GetLocation[] returns the current \
GeoLongitude, GeoLatitude, GeoAltitude and TimeZone of your location on \
Earth. GetLocation[object, date] returns the GeoLongitude, GeoLatitude and \
GeoAltitude of an object (typically a low orbit Earth satellite). Note \
GetLocation[] is effectively equivalent to GetLocation[TopoCentric]. If date \
is omitted the current Date[] is used."

(* ModifiedJulianDay[{y_, m_, d_, h_, min_, s_}] := Module[{erg},
   erg = DateDistance[Gregorian[1900, 1, 1], Gregorian[y, m, d]];
   If[y < 0, erg = erg + 1]; 
   erg = N[erg + h/24 + min/(24*60) + s/(24*3600), 20]; erg];
ModifiedJulianDay[{y_, m_, d_}] := Module[{erg},
   erg = DateDistance[Gregorian[1900, 1, 1], Gregorian[y, m, d]];
   If[y < 0, erg = erg + 1]; erg]; *) 

ModifiedJulianDay[] := ModifiedJulianDay[Date[]]
 
ModifiedJulianDay[datum_] := 
    LastDAY /; datum === 
      dateLastDAY

ModifiedJulianDay[date:{_Integer | _Real, 
       _Integer | _Real, _Integer | _Real, _Integer | _Real, 
       _Integer | _Real, _Integer | _Real}] := 
    (dateLastDAY = date; 
     If[date[[1]] < 0, dateLastDAY[[1]] = dateLastDAY[[1]] - 1; 
        dateLastDAY[[3]] = dateLastDAY[[3]] + 1];
     LastDAY = (FromDate[dateLastDAY] - 
        Epoch$1900)/86400.)
 
ModifiedJulianDay[{y:_Integer | _Real, 
      m:_Integer | _Real, d:
       _Integer | _Real}] := ModifiedJulianDay[{y, 
      m, d, 0, 0, 0}]
 
ModifiedJulianDay[day:_Real | _Integer] := 
    day 
 
ModifiedJulianDay /: ModifiedJulianDay::trace = ""
 
ModifiedJulianDay /: ModifiedJulianDay::usage = "ModifiedJulianDay[date] \
returns the modified Julian day number of the date. The date can be specified \
either in the form {year, month, day, hour, minute, second} or {year, month, \
day}. If date is omitted the current Date[] is used. The modified Julian day \
numbered 1 is the start of the first day of the year 1900, and to get the \
true Julian day number just add 2415019.5"
 
EquatorCoordinates[Andromeda, ___] := {Ascension -> 0.5*Hour, 
     Declination -> 36*Degree}
 
EquatorCoordinates[Antlia, ___] := {Ascension -> 10.5*Hour, 
     Declination -> -34*Degree}
 
EquatorCoordinates[Apus, ___] := {Ascension -> 16.*Hour, 
     Declination -> -78*Degree}
 
EquatorCoordinates[Aquarius, ___] := {Ascension -> 22.5*Hour, 
     Declination -> -10*Degree}
 
EquatorCoordinates[Aquila, ___] := {Ascension -> 19.5*Hour, 
     Declination -> 5*Degree}
 
EquatorCoordinates[Ara, ___] := {Ascension -> 17.5*Hour, 
     Declination -> -53*Degree}
 
EquatorCoordinates[Aries, ___] := {Ascension -> 2.5*Hour, 
     Declination -> 21*Degree}
 
EquatorCoordinates[Auriga, ___] := {Ascension -> 5.5*Hour, 
     Declination -> 40*Degree}
 
EquatorCoordinates[Bootes, ___] := {Ascension -> 14.5*Hour, 
     Declination -> 25*Degree}
 
EquatorCoordinates[Caelum, ___] := {Ascension -> 4.5*Hour, 
     Declination -> -40*Degree}
 
EquatorCoordinates[Camelopardalis, ___] := {Ascension -> 5.*Hour, 
     Declination -> 66*Degree}
 
EquatorCoordinates[Cancer, ___] := {Ascension -> 8.5*Hour, 
     Declination -> 17*Degree}
 
EquatorCoordinates[CanesVenatici, ___] := {Ascension -> 13.*Hour, 
     Declination -> 40*Degree}
 
EquatorCoordinates[CanisMajor, ___] := {Ascension -> 7.*Hour, 
     Declination -> -22*Degree}
 
EquatorCoordinates[CanisMinor, ___] := {Ascension -> 7.5*Hour, 
     Declination -> 7*Degree}
 
EquatorCoordinates[Capricornus, ___] := {Ascension -> 21.*Hour, 
     Declination -> -19*Degree}
 
EquatorCoordinates[Carina, ___] := {Ascension -> 8.5*Hour, 
     Declination -> -61*Degree}
 
EquatorCoordinates[Cassiopeia, ___] := {Ascension -> 1.*Hour, 
     Declination -> 62*Degree}
 
EquatorCoordinates[Centaurus, ___] := {Ascension -> 13.5*Hour, 
     Declination -> -45*Degree}
 
EquatorCoordinates[Cepheus, ___] := {Ascension -> 22.5*Hour, 
     Declination -> 70*Degree}
 
EquatorCoordinates[Cetus, ___] := {Ascension -> 1.5*Hour, 
     Declination -> -13*Degree}
 
EquatorCoordinates[Chamaeleon, ___] := {Ascension -> 10.5*Hour, 
     Declination -> -80*Degree}
 
EquatorCoordinates[Circinus, ___] := {Ascension -> 14.5*Hour, 
     Declination -> -64*Degree}
 
EquatorCoordinates[Columba, ___] := {Ascension -> 6.*Hour, 
     Declination -> -38*Degree}
 
EquatorCoordinates[ComaBerenices, ___] := {Ascension -> 13.*Hour, 
     Declination -> 25*Degree}
 
EquatorCoordinates[CoronaAustralis, ___] := {Ascension -> 19.*Hour, 
     Declination -> -41*Degree}
 
EquatorCoordinates[CoronaBorealis, ___] := {Ascension -> 15.5*Hour, 
     Declination -> 29*Degree}
 
EquatorCoordinates[Corvus, ___] := {Ascension -> 12.5*Hour, 
     Declination -> -20*Degree}
 
EquatorCoordinates[Crater, ___] := {Ascension -> 11.5*Hour, 
     Declination -> -17*Degree}
 
EquatorCoordinates[Crux, ___] := {Ascension -> 12.5*Hour, 
     Declination -> -61*Degree}
 
EquatorCoordinates[Cygnus, ___] := {Ascension -> 20.*Hour, 
     Declination -> 37*Degree}
 
EquatorCoordinates[Delphinus, ___] := {Ascension -> 20.5*Hour, 
     Declination -> 14*Degree}
 
EquatorCoordinates[Dorado, ___] := {Ascension -> 5.*Hour, 
     Declination -> -61*Degree}
 
EquatorCoordinates[Draco, ___] := {Ascension -> 17.*Hour, 
     Declination -> 64*Degree}
 
EquatorCoordinates[Equuleus, ___] := {Ascension -> 21.*Hour, 
     Declination -> 9*Degree}
 
EquatorCoordinates[Eridanus, ___] := {Ascension -> 4.*Hour, 
     Declination -> -16*Degree}
 
EquatorCoordinates[Fornax, ___] := {Ascension -> 3.*Hour, 
     Declination -> -31*Degree}
 
EquatorCoordinates[Gemini, ___] := {Ascension -> 7.*Hour, 
     Declination -> 24*Degree}
 
EquatorCoordinates[Grus, ___] := {Ascension -> 22.5*Hour, 
     Declination -> -45*Degree}
 
EquatorCoordinates[Hercules, ___] := {Ascension -> 17.*Hour, 
     Declination -> 28*Degree}
 
EquatorCoordinates[Horologium, ___] := {Ascension -> 2.5*Hour, 
     Declination -> -50*Degree}
 
EquatorCoordinates[Hydra, ___] := {Ascension -> 10.*Hour, 
     Declination -> -15*Degree}
 
EquatorCoordinates[Hydrus, ___] := {Ascension -> 2.5*Hour, 
     Declination -> -72*Degree}
 
EquatorCoordinates[Indus, ___] := {Ascension -> 21.5*Hour, 
     Declination -> -55*Degree}
 
EquatorCoordinates[Lacerta, ___] := {Ascension -> 22.5*Hour, 
     Declination -> 47*Degree}
 
EquatorCoordinates[Leo, ___] := {Ascension -> 10.5*Hour, 
     Declination -> 16*Degree}
 
EquatorCoordinates[LeoMinor, ___] := {Ascension -> 10.5*Hour, 
     Declination -> 35*Degree}
 
EquatorCoordinates[Lepus, ___] := {Ascension -> 5.*Hour, 
     Declination -> -20*Degree}
 
EquatorCoordinates[Libra, ___] := {Ascension -> 15.*Hour, 
     Declination -> -21*Degree}
 
EquatorCoordinates[Lupus, ___] := {Ascension -> 15.*Hour, 
     Declination -> -46*Degree}
 
EquatorCoordinates[Lynx, ___] := {Ascension -> 8.*Hour, 
     Declination -> 44*Degree}
 
EquatorCoordinates[Lyra, ___] := {Ascension -> 18.5*Hour, 
     Declination -> 35*Degree}
 
EquatorCoordinates[Mensa, ___] := {Ascension -> 5.*Hour, 
     Declination -> -77*Degree}
 
EquatorCoordinates[Microscopium, ___] := {Ascension -> 21.*Hour, 
     Declination -> -40*Degree}
 
EquatorCoordinates[Monoceros, ___] := {Ascension -> 7.*Hour, 
     Declination -> 0*Degree}
 
EquatorCoordinates[Musca, ___] := {Ascension -> 12.5*Hour, 
     Declination -> -70*Degree}
 
EquatorCoordinates[Norma, ___] := {Ascension -> 16.*Hour, 
     Declination -> -52*Degree}
 
EquatorCoordinates[Octans, ___] := {Ascension -> 21.*Hour, 
     Declination -> -82*Degree}
 
EquatorCoordinates[Ophiuchus, ___] := {Ascension -> 17.*Hour, 
     Declination -> 0*Degree}
 
EquatorCoordinates[Orion, ___] := {Ascension -> 5.5*Hour, 
     Declination -> 3*Degree}
 
EquatorCoordinates[Pavo, ___] := {Ascension -> 19.5*Hour, 
     Declination -> -66*Degree}
 
EquatorCoordinates[Pegasus, ___] := {Ascension -> 22.5*Hour, 
     Declination -> 19*Degree}
 
EquatorCoordinates[Perseus, ___] := {Ascension -> 3.5*Hour, 
     Declination -> 45*Degree}
 
EquatorCoordinates[Phoenix, ___] := {Ascension -> 1.*Hour, 
     Declination -> -48*Degree}
 
EquatorCoordinates[Pictor, ___] := {Ascension -> 7.*Hour, 
     Declination -> -63*Degree}
 
EquatorCoordinates[Pisces, ___] := {Ascension -> 0.5*Hour, 
     Declination -> 10*Degree}
 
EquatorCoordinates[PiscisAustrinus, ___] := {Ascension -> 23.*Hour, 
     Declination -> -28*Degree}
 
EquatorCoordinates[Puppis, ___] := {Ascension -> 8.*Hour, 
     Declination -> -34*Degree}
 
EquatorCoordinates[Pyxis, ___] := {Ascension -> 9.*Hour, 
     Declination -> -30*Degree}
 
EquatorCoordinates[Reticulum, ___] := {Ascension -> 4.*Hour, 
     Declination -> -61*Degree}
 
EquatorCoordinates[Sagitta, ___] := {Ascension -> 19.5*Hour, 
     Declination -> 18*Degree}
 
EquatorCoordinates[Sagittarius, ___] := {Ascension -> 19.*Hour, 
     Declination -> -25*Degree}
 
EquatorCoordinates[Scorpius, ___] := {Ascension -> 17.*Hour, 
     Declination -> -32*Degree}
 
EquatorCoordinates[Sculptor, ___] := {Ascension -> 0.*Hour, 
     Declination -> -30*Degree}
 
EquatorCoordinates[Scutum, ___] := {Ascension -> 18.5*Hour, 
     Declination -> -10*Degree}
 
EquatorCoordinates[Serpens, ___] := {Ascension -> 18.*Hour, 
     Declination -> -5*Degree}
 
EquatorCoordinates[Sextans, ___] := {Ascension -> 10.*Hour, 
     Declination -> -4*Degree}
 
EquatorCoordinates[Taurus, ___] := {Ascension -> 5.*Hour, 
     Declination -> 20*Degree}
 
EquatorCoordinates[Telescopium, ___] := {Ascension -> 19.*Hour, 
     Declination -> -51*Degree}
 
EquatorCoordinates[Triangulum, ___] := {Ascension -> 2.*Hour, 
     Declination -> 31*Degree}
 
EquatorCoordinates[TriangulumAustrale, ___] := {Ascension -> 16.*Hour, 
     Declination -> -66*Degree}
 
EquatorCoordinates[Tucana, ___] := {Ascension -> 22.5*Hour, 
     Declination -> -59*Degree}
 
EquatorCoordinates[UrsaMajor, ___] := {Ascension -> 12.*Hour, 
     Declination -> 59*Degree}
 
EquatorCoordinates[UrsaMinor, ___] := {Ascension -> 14.*Hour, 
     Declination -> 73*Degree}
 
EquatorCoordinates[Vela, ___] := {Ascension -> 9.5*Hour, 
     Declination -> -49*Degree}
 
EquatorCoordinates[Virgo, ___] := {Ascension -> 13.5*Hour, 
     Declination -> -4*Degree}
 
EquatorCoordinates[Volans, ___] := {Ascension -> 8.*Hour, 
     Declination -> -70*Degree}
 
EquatorCoordinates[Vulpecula, ___] := {Ascension -> 20.*Hour, 
     Declination -> 25*Degree}
 
EquatorCoordinates[NorthCelestialPole, ___] := {Ascension -> 0, 
     Declination -> 90*Degree}
 
EquatorCoordinates[SouthCelestialPole, ___] := {Ascension -> 0, 
     Declination -> -90*Degree}
 
EquatorCoordinates[Zenith, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 0, Altitude -> 90*Degree}, day, 
     opts]
 
EquatorCoordinates[Nadir, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 0, Altitude -> -90*Degree}, day, 
     opts]
 
EquatorCoordinates[North, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 0*Degree, Altitude -> 0}, day, 
     opts]
 
EquatorCoordinates[South, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 180*Degree, Altitude -> 0}, day, 
     opts]
 
EquatorCoordinates[East, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 90*Degree, Altitude -> 0}, day, 
     opts]
 
EquatorCoordinates[West, day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {Azimuth -> 270*Degree, Altitude -> 0}, day, 
     opts]
 
EquatorCoordinates[GeoCentric, day:_Real | _Integer, 
     opts___Rule] := 
    Equator$Coordinates[Coordinates[GeoCentric, 
      day, opts], 
     day, opts]
 
EquatorCoordinates[TopoCentric, day:_Real | _Integer, 
     opts___Rule] := 
    Equator$Coordinates[Coordinates[TopoCentric, 
      day, opts], 
     day, opts]
 
EquatorCoordinates[(star_) . 
      (constell_), day:
      _Real | _Integer, opts___Rule] := 
    Block[{stars, ascension, 
      declination, epoch}, 
     stars = Cases[TheStars, 
        {constell, star, __}]; 
      If[stars === {}, Return[{Ascension -> 0.*Hour, 
         Declination -> 90.*Degree, Distance -> Infinity}]]; 
      ascension = stars[[1,4]]/15; 
      declination = stars[[1,5]]; 
      epoch = Epoch /. {opts} /. 
        Options[EquatorCoordinates]; If[epoch === 
        Automatic, epoch = 
        1900. + day/365.2425]; 
      If[NumberQ[epoch], {ascension, 
         declination} = epochChange[
         (2000. - 1900.)*365.2425, {ascension, 
          declination}, (epoch - 
           1900.)*365.2425]]; {Ascension -> ascension*
         Hour, Declination -> declination*Degree, 
       Distance -> Infinity}]
 
EquatorCoordinates[{hcoords___Rule}, 
     day:_Real | _Integer, 
     opts___Rule] := h2eCoordinates[
     {hcoords}, day, 
     opts]
 
EquatorCoordinates[xyz:{_Real | _Integer, 
       _Real | _Integer, _Real | _Integer}, day:
      _Real | _Integer, opts___Rule] := 
    Equator$Coordinates[N[xyz], 
     day, opts]
 
EquatorCoordinates[object_, 
     opts___Rule] := EquatorCoordinates[
     object, Date[], opts]
 
EquatorCoordinates[object_, 
     datum_List, opts___Rule] := 
    EquatorCoordinates[object, 
     ModifiedJulianDay[datum], opts]
 
EquatorCoordinates[(object_)?
      SatelliteQ, day:
      _Real | _Integer, opts___Rule] := 
    If[(ViewPoint /. {opts} /. Options[Coordinates]) === 
      Earth, satEquatorCoords[object, 
      day, opts], 
     Equator$Coordinates[Coordinates[
       object, day, 
       opts], day, 
      opts]]
 
EquatorCoordinates[(object_)?ObjectQ, 
     day:_Real | _Integer, 
     opts___Rule] := 
    Equator$Coordinates[
     Coordinates[object, day, 
      opts], day, 
     opts]
 
EquatorCoordinates[object_, day:
      _Real | _Integer, opts___Rule] := 
    (Message[Coordinates::badobject, object]; 
     Equator$Coordinates[Coordinates[Sun, 
       day, opts], 
      day, opts])
 
Options[EquatorCoordinates] = {Epoch -> Automatic}
 
EquatorCoordinates /: EquatorCoordinates::trace = ""
 
EquatorCoordinates /: EquatorCoordinates::usage = "EquatorCoordinates[object, \
date] returns the Ascension, Declination and Distance of the object (a planet \
or a star) on the given date. An example planet would be Mars, and an example \
star would be Alpha.Centaurus. EquatorCoordinates[horizoncoords, date] will \
convert the horizoncoords for the current location into equatorcoords. An \
example horizoncoords would be {Azimuth->270*Degree, Altitude->30*Degree}. If \
date is omitted the current Date[] is used."
 
Andromeda /: Andromeda::usage = "Andromeda is a constellation. (And)"
 
Antlia /: Antlia::usage = "Antlia is a constellation. (Ant)"
 
Apus /: Apus::usage = "Apus is a constellation. (Aps)"
 
Aquarius /: Aquarius::usage = "Aquarius is a constellation. (Aqr)"
 
Aquila /: Aquila::usage = "Aquila is a constellation. (Aql)"
 
Ara /: Ara::usage = "Ara is a constellation. (Ara)"
 
Aries /: Aries::usage = "Aries is a constellation. (Ari)"
 
Auriga /: Auriga::usage = "Auriga is a constellation. (Aur)"
 
Bootes /: Bootes::usage = "Bootes is a constellation. (Boo)"
 
Caelum /: Caelum::usage = "Caelum is a constellation. (Cae)"
 
Camelopardalis /: Camelopardalis::usage = 
     "Camelopardalis is a constellation. (Cam)"
 
Cancer /: Cancer::usage = "Cancer is a constellation. (Cnc)"
 
CanesVenatici /: CanesVenatici::usage = 
     "CanesVenatici is a constellation. (CVn)"
 
CanisMajor /: CanisMajor::usage = "CanisMajor is a constellation. (CMa)"
 
CanisMinor /: CanisMinor::usage = "CanisMinor is a constellation. (CMi)"
 
Capricornus /: Capricornus::usage = "Capricornus is a constellation. (Cap)"
 
Carina /: Carina::usage = "Carina is a constellation. (Car)"
 
Cassiopeia /: Cassiopeia::usage = "Cassiopeia is a constellation. (Cas)"
 
Centaurus /: Centaurus::usage = "Centaurus is a constellation. (Cen)"
 
Cepheus /: Cepheus::usage = "Cepheus is a constellation. (Cep)"
 
Cetus /: Cetus::usage = "Cetus is a constellation. (Cet)"
 
Chamaeleon /: Chamaeleon::usage = "Chamaeleon is a constellation. (Cha)"
 
Circinus /: Circinus::usage = "Circinus is a constellation. (Cir)"
 
Columba /: Columba::usage = "Columba is a constellation. (Col)"
 
ComaBerenices /: ComaBerenices::usage = 
     "ComaBerenices is a constellation. (Com)"
 
CoronaAustralis /: CoronaAustralis::usage = 
     "CoronaAustralis is a constellation. (CrA)"
 
CoronaBorealis /: CoronaBorealis::usage = 
     "CoronaBorealis is a constellation. (CrB)"
 
Corvus /: Corvus::usage = "Corvus is a constellation. (Crv)"
 
Crater /: Crater::usage = "Crater is a constellation. (Crt)"
 
Crux /: Crux::usage = "Crux is a constellation. (Cru)"
 
Cygnus /: Cygnus::usage = "Cygnus is a constellation. (Cyg)"
 
Delphinus /: Delphinus::usage = "Delphinus is a constellation. (Del)"
 
Dorado /: Dorado::usage = "Dorado is a constellation. (Dor)"
 
Draco /: Draco::usage = "Draco is a constellation. (Dra)"
 
Equuleus /: Equuleus::usage = "Equuleus is a constellation. (Equ)"
 
Eridanus /: Eridanus::usage = "Eridanus is a constellation. (Eri)"
 
Fornax /: Fornax::usage = "Fornax is a constellation. (For)"
 
Gemini /: Gemini::usage = "Gemini is a constellation. (Gem)"
 
Grus /: Grus::usage = "Grus is a constellation. (Gru)"
 
Hercules /: Hercules::usage = "Hercules is a constellation. (Her)"
 
Horologium /: Horologium::usage = "Horologium is a constellation. (Hor)"
 
Hydra /: Hydra::usage = "Hydra is a constellation. (Hya)"
 
Hydrus /: Hydrus::usage = "Hydrus is a constellation. (Hyi)"
 
Indus /: Indus::usage = "Indus is a constellation. (Ind)"
 
Lacerta /: Lacerta::usage = "Lacerta is a constellation. (Lac)"
 
Leo /: Leo::usage = "Leo is a constellation. (Leo)"
 
LeoMinor /: LeoMinor::usage = "LeoMinor is a constellation. (LMi)"
 
Lepus /: Lepus::usage = "Lepus is a constellation. (Lep)"
 
Libra /: Libra::usage = "Libra is a constellation. (Lib)"
 
Lupus /: Lupus::usage = "Lupus is a constellation. (Lup)"
 
Lynx /: Lynx::usage = "Lynx is a constellation. (Lyn)"
 
Lyra /: Lyra::usage = "Lyra is a constellation. (Lyr)"
 
Mensa /: Mensa::usage = "Mensa is a constellation. (Men)"
 
Microscopium /: Microscopium::usage = "Microscopium is a constellation. (Mic)"
 
Monoceros /: Monoceros::usage = "Monoceros is a constellation. (Mon)"
 
Musca /: Musca::usage = "Musca is a constellation. (Mus)"
 
Norma /: Norma::usage = "Norma is a constellation. (Nor)"
 
Octans /: Octans::usage = "Octans is a constellation. (Oct)"
 
Ophiuchus /: Ophiuchus::usage = "Ophiuchus is a constellation. (Oph)"
 
Orion /: Orion::usage = "Orion is a constellation. (Ori)"
 
Pavo /: Pavo::usage = "Pavo is a constellation. (Pav)"
 
Pegasus /: Pegasus::usage = "Pegasus is a constellation. (Peg)"
 
Perseus /: Perseus::usage = "Perseus is a constellation. (Per)"
 
Phoenix /: Phoenix::usage = "Phoenix is a constellation. (Phe)"
 
Pictor /: Pictor::usage = "Pictor is a constellation. (Pic)"
 
Pisces /: Pisces::usage = "Pisces is a constellation. (Psc)"
 
PiscisAustrinus /: PiscisAustrinus::usage = 
     "PiscisAustrinus is a constellation. (PsA)"
 
Puppis /: Puppis::usage = "Puppis is a constellation. (Pup)"
 
Pyxis /: Pyxis::usage = "Pyxis is a constellation. (Pyx)"
 
Reticulum /: Reticulum::usage = "Reticulum is a constellation. (Ret)"
 
Sagitta /: Sagitta::usage = "Sagitta is a constellation. (Sge)"
 
Sagittarius /: Sagittarius::usage = "Sagittarius is a constellation. (Sgr)"
 
Scorpius /: Scorpius::usage = "Scorpius is a constellation. (Sco)"
 
Sculptor /: Sculptor::usage = "Sculptor is a constellation. (Scl)"
 
Scutum /: Scutum::usage = "Scutum is a constellation. (Sct)"
 
Serpens /: Serpens::usage = "Serpens is a constellation. (Ser)"
 
Sextans /: Sextans::usage = "Sextans is a constellation. (Sex)"
 
Taurus /: Taurus::usage = "Taurus is a constellation. (Tau)"
 
Telescopium /: Telescopium::usage = "Telescopium is a constellation. (Tel)"
 
Triangulum /: Triangulum::usage = "Triangulum is a constellation. (Tri)"
 
TriangulumAustrale /: TriangulumAustrale::usage = 
     "TriangulumAustrale is a constellation. (TrA)"
 
Tucana /: Tucana::usage = "Tucana is a constellation. (Tuc)"
 
UrsaMajor /: UrsaMajor::usage = "UrsaMajor is a constellation. (UMa)"
 
UrsaMinor /: UrsaMinor::usage = "UrsaMinor is a constellation. (UMi)"
 
Vela /: Vela::usage = "Vela is a constellation. (Vel)"
 
Virgo /: Virgo::usage = "Virgo is a constellation. (Vir)"
 
Volans /: Volans::usage = "Volans is a constellation. (Vol)"
 
Vulpecula /: Vulpecula::usage = "Vulpecula is a constellation. (Vul)"
 
NorthCelestialPole /: NorthCelestialPole::trace = ""
 
NorthCelestialPole /: NorthCelestialPole::usage = "NorthCelestialPole is the \
North Celestial Pole, ie. the point with Declination -> 90*Degree. This \
object can be used as if it were a star."
 
SouthCelestialPole /: SouthCelestialPole::trace = ""
 
SouthCelestialPole /: SouthCelestialPole::usage = "SouthCelestialPole is the \
South Celestial Pole, ie. the point with Declination -> -90*Degree. This \
object can be used as if it were a star."
 
Zenith /: Zenith::trace = ""
 
Zenith /: Zenith::usage = "Zenith is the point in the direction directly over \
your head, ie. the point with Altitude -> 90*Degree. This object can be used \
as if it were a star."
 
h2eCoordinates[ecoords:
      {___, Declination -> _, ___}, ___] := ecoords
 
h2eCoordinates[{hcoords___Rule}, 
     day:_Real | _Integer, 
     opts___Rule] := 
    Block[{azimuth, altitude, 
      distance, s1, 
      c1, s2, c2, 
      ha, dec, 
      asc, ascension, 
      declination}, 
     {azimuth, altitude, 
        distance} = N[{Azimuth, Altitude, Distance} /. 
         {hcoords}]; s1 = 
       Sin[altitude]; c1 = 
       Cos[altitude]; s2 = 
       Sin[azimuth]; c2 = 
       Cos[azimuth]; dec = 
       ArcSin[Sin$Geo$Latitude*s1 + 
         Cos$Geo$Latitude*c1*
          c2]; declination = 
       N[dec/Degree]; 
      If[Chop[Abs[declination] - 90] === 0, 
       ascension = 0., ha = 
         ArcTan[Cos$Geo$Latitude*s1 - 
           Sin$Geo$Latitude*c1*
            c2, c1*
           s2]; asc = 
         N[ha + (Geo$Longitude + 
             360*(day - Floor[day]) + 
             SolarMeanLongitude[
              day] - 180)*Degree]; 
        ascension = Mod[asc/N[Hour], 
          24]]; epoch = 
       Epoch /. {opts} /. Epoch -> Automatic; 
      If[NumberQ[epoch], {ascension, 
         declination} = epochChange[
         day, {ascension, 
          declination}, (epoch - 
           1900.)*365.2425]]; If[distance =!= Distance, 
       {Ascension -> ascension*Hour, 
        Declination -> declination*Degree, 
        Distance -> distance}, 
       {Ascension -> ascension*Hour, 
        Declination -> declination*Degree}]]
 
h2eCoordinates /: 
    h2eCoordinates::trace = ""
 
North /: North::trace = ""
 
North /: North::usage = "North is the point on the local horizon in the \
direction towards north, i.e the point with Azimuth->0*Degree, Altitude -> \
0*Degree. This object can be used in the HorizonStarChart command, but can \
also be used in other commands where it is treated as if it were a star."
 
West /: West::trace = ""
 
West /: West::usage = "West is the point on the local horizon in the \
direction towards west, i.e the point with Azimuth->270*Degree, Altitude -> \
0*Degree. This object can be used in the HorizonStarChart command, but can \
also be used in other commands where it is treated as if it were a star."
 
GeoCentric /: GeoCentric::trace = ""
 
GeoCentric /: GeoCentric::usage = "GeoCentric is a possible ViewPoint which \
specifies that the viewing location is at the Earth's centre."
 
Equator$Coordinates[{dx_, 
      dy_, dz_}, 
     day_, opts___] := 
    Block[{tilt, c, 
      s, dy1, 
      dz1, dr, 
      ascension, declination, 
      distance, epoch}, 
     tilt = EarthTilt[
         day]*N[Degree]; c = 
       Cos[tilt]; s = 
       Sin[tilt]; dy1 = 
       c*dy - s*
         dz; dz1 = 
       s*dy + c*
         dz; dr = 
       Sqrt[dx^2 + dy1^2]; 
      distance = Sqrt[dr^2 + 
         dz1^2]; 
      If[Chop[distance] === 0, 
       Return[{Ascension -> 0, Declination -> 0, Distance -> 0}]]; 
      declination = ArcTan[dr, 
         dz1]/N[Degree]; 
      If[Chop[Abs[declination] - 90] === 0, 
       ascension = 0., ascension = 
         ArcTan[dx, dy1]/N[Hour]; 
        If[ascension < 0, 
         ascension += 24]]; epoch = 
       Epoch /. {opts} /. Options[EquatorCoordinates]; 
      If[NumberQ[epoch], {ascension, 
         declination} = epochChange[
         day, {ascension, 
          declination}, (epoch - 
           1900.)*365.2425]]; {Ascension -> ascension*
         Hour, Declination -> declination*Degree, 
       Distance -> distance*AU}]
 
Equator$Coordinates /: 
    Equator$Coordinates::trace = ""
 
AU /: AU::trace = ""
 
AU /: AU::usage = 
     "AU is the Astronomical Unit. It equals about 149,597,900km."
 
Coordinates[object_, opts___Rule] := 
    Coordinates[object, Date[], opts]
 
Coordinates[object_, datum_List, 
     opts___Rule] := 
    Coordinates[object, ModifiedJulianDay[
      datum], opts]
 
Coordinates[object_, day:
      _Real | _Integer, opts___Rule] := 
    Block[{viewpoint, viewxyz, 
      planxyz}, planxyz = 
       GetCoords[object, 
        day]; If[ListQ[object], 
       viewxyz = {0, 0, 0}, 
       viewpoint = 
         ViewPoint /. {opts} /. Options[Coordinates]; 
        viewxyz = GetCoords[
          viewpoint, day]]; 
      planxyz - viewxyz]
 
Options[Coordinates] = {ViewPoint -> Earth}
 
Coordinates /: Coordinates::badobject = "No such object as `1`. Using Sun."
 
Coordinates /: Coordinates::badstar = 
     "No such star as `1`. Using North Celestial Pole."
 
Coordinates /: Coordinates::trace = ""
 
Coordinates /: Coordinates::usage = "Coordinates[object, date] returns the \
x,y,z coordinates in Astronomical Units of the object (a planet or a star, or \
Sun, Moon or asteroid) on the given date. If date is omitted the current \
Date[] is used."
 
GetCoords[Sun, day_] := {0., 0., 0.}
 
GetCoords[Earth, day_] := 
    Earthxyz[day]
 
GetCoords[GeoCentric, day_] := 
    Earthxyz[day]
 
GetCoords[TopoCentric, day_] := 
    Earthxyz[day] + 
     Topoxyz[day]
 
GetCoords[Moon, day_] := 
    Earthxyz[day] + 
     Moonxyz[day]
 
GetCoords[xyz:
      {_Real | _Integer, _Real | _Integer, _Real | _Integer}, 
     day_] := N[xyz]
 
GetCoords[(object_)?
      ObjectQ, day_] := 
    Objectxyz[object, 
      day] + GetCoords[
      ParentBody[object], 
      day]
 
GetCoords[object_, 
     day_] := Block[{asc, 
      dec, dist, 
      tilt, c, s, 
      cosD, dy1, 
      dz1}, 
     {asc, dec, 
        dist} = {Ascension, Declination, Distance} /. 
        EquatorCoordinates[object, 
         day, ViewPoint -> Sun]; 
      asc = N[asc]; 
      dec = N[dec]; 
      dist = If[dist === Infinity || 
         dist === Distance, 10^30, 
        dist /. AU -> 1]; tilt = 
       EarthTilt[day]*N[Degree]; 
      c = Cos[tilt]; 
      s = Sin[tilt]; 
      cosD = Cos[dec]; 
      dz1 = Sin[dec]; 
      dy1 = Sin[asc]*
        cosD; {Cos[asc]*
         cosD, c*
          dy1 + s*
          dz1, -(s*
           dy1) + c*
          dz1}*dist]
 
GetCoords /: GetCoords::trace = ""
 
Earthxyz[d_] := 
    LastEarthxyz /; d === 
      dLastEarthxyz
 
Earthxyz[d_] := 
    (dLastEarthxyz = d; 
     LastEarthxyz = -Sunxyz[
        d])
 
Earthxyz /: Earthxyz::trace = ""
 
Sunxyz[day_] := 
    Block[{d, T, theta, 
      latitude, longitude, 
      x, y, z, 
      r, Semi$Major, 
      Solar$Longitude, 
      Solar$Distance, Solar$Perigee, 
      Solar$Eccentricity, 
      Solar$Anomaly}, 
     d = day; 
      T = day/36525.; Semi$Major = 
       1.00000023; Solar$Longitude = 
       Mod[279.20385 + 0.9856473354*d + 0.0003025*T^2, 
        360]; Solar$Eccentricity = 
       0.01675104 - T*(0.0000418 + T*1.26*^-7); 
      Solar$Perigee = 281.22081 + 
        T*(1.719173 + T*(0.000453 + T*3.*^-6)); 
      Solar$Anomaly = 
       Solar$Longitude - 
        Solar$Perigee; 
      Solar$Distance = Semi$Major*
        (1 - Solar$Eccentricity^2); 
      theta = true$anomaly[
        Solar$Anomaly, 
        Solar$Eccentricity]; 
      latitude = 0; Solar$Longitude = 
       Mod[theta/N[Degree] + 
         Solar$Perigee, 360]; 
      longitude = Solar$Longitude*
        N[Degree]; r = Solar$Distance/
        (1 + Solar$Eccentricity*
          Cos[theta]); x = 
       r*Cos[longitude]; 
      y = r*
        Sin[longitude]; z = 0.; 
      {x, y, z}]
 
Sunxyz /: Sunxyz::trace = ""
 
TopoCentric /: TopoCentric::trace = ""
 
TopoCentric /: TopoCentric::usage = "TopoCentric is a possible ViewPoint \
which specifies that the viewing location is on the Earth's surface."
 
Topoxyz[d_] := 
    LastTopoxyz /; d === 
      dLastTopoxyz
 
Topoxyz[d_] := 
    Block[{R3, R1, 
      c3, s3, c1, 
      s1, xe, ye, 
      ze, x1, y1, 
      z1, x, y, 
      z}, R3 = 
       (SolarMeanLongitude[d] + 
         360*(d - Round[d]) - 180)*
        N[Degree]; R1 = 
       -(EarthTilt[d]*N[Degree]); 
      c3 = Cos[R3]; 
      s3 = Sin[R3]; 
      c1 = Cos[R1]; 
      s1 = Sin[R1]; 
      {xe, ye, 
        ze} = Topo$x$y$z; 
      x1 = c3*
         xe - s3*
         ye; y1 = 
       s3*xe + c3*
         ye; z1 = 
       ze; x = 
       x1; y = 
       c1*y1 - s1*
         z1; z = 
       s1*y1 + c1*
         z1; dLastTopoxyz = 
       d; LastTopoxyz = 
       {x, y, z}]
 
Topoxyz /: Topoxyz::trace = ""
 
Moonxyz[day_] := 
    Block[{d, T, Mean$Distance, 
      Mean$Longitude, Eccentricity, 
      Perigee$Longitude, 
      Orbital$Tilt, 
      Ascension$Longitude, 
      Perigee$Argument, Mean$Anomaly, 
      Solar$Longitude, Solar$Anomaly, 
      rot, theta, 
      D1, F1, D2, 
      cosTheta, sinTheta, 
      r, x0, y0, 
      x, y, z, 
      evectionOfLat}, 
     d = day; 
      T = day/36525.; Mean$Distance = 
       383243./1.495979*^8; Mean$Longitude = 
       Mod[263.84596 + 13.1763965268*d + 
         T^2*(-0.001133 + 1.9*^-6*T), 360]; 
      Eccentricity = 0.054900489; 
      Perigee$Longitude = 
       Mod[334.273854 + 0.1114040803*d + 
         T^2*(-0.010325 - 0.000012*T), 360]; 
      Orbital$Tilt = 5.1453964; 
      Ascension$Longitude = 
       Mod[259.209752 - 0.0529539222*d + 
         T^2*(0.002078 + 2.*^-6*T), 360]; Mean$Anomaly = 
       Mod[Mean$Longitude - 
         Perigee$Longitude, 360]; 
      Perigee$Argument = 
       Mod[Perigee$Longitude - 
         Ascension$Longitude, 360]; 
      rot = getROT[Moon, 
        d, Perigee$Argument, 
        Ascension$Longitude, 
        Orbital$Tilt]; 
      Solar$Longitude = 
       SolarLongitudeP[d]; 
      Solar$Anomaly = SolarAnomaly[
        d]; theta = 
       get$theta[Mean$Anomaly, 
        Mean$Longitude, 
        Ascension$Longitude, 
        Solar$Anomaly, 
        Solar$Longitude]; cosTheta = 
       Cos[theta]; sinTheta = 
       Sin[theta]; r = 
       Mean$Distance/
        (1 + Eccentricity*cosTheta); 
      x0 = r*
        cosTheta; y0 = 
       r*sinTheta; 
      {x, y, z} = 
       rot . {x0, 
         y0}; D1 = 
       (Mean$Longitude - 
         Solar$Longitude)*N[Degree]; 
      F1 = (Mean$Longitude - 
         Ascension$Longitude)*N[Degree]; 
      D2 = 2*D1; 
      evectionOfLat = 0.002717*r*
        Sin[D2 - F1]; 
      z += evectionOfLat; 
      {x, y, z}]
 
Moonxyz /: Moonxyz::trace = ""
 
getROT[planet_, 
     day_, Perigee$Argument_, 
     Ascension$Longitude_, 
     Orbital$Tilt_] := 
    Block[{flatdays, lastday, 
      rot, R1, 
      R2, R3, s1, 
      c1, s2, c2, 
      s3, c3, 
      s3c2, c3c2, 
      a11, a12, 
      a21, a22, 
      a31, a32, 
      c, s}, 
     {flatdays, lastday, 
        rot} = lastROT[
        planet]; 
      If[Abs[lastday - day] > 
        flatdays, R1 = 
         Perigee$Argument*N[Degree]; 
        R2 = Orbital$Tilt*N[Degree]; 
        R3 = Ascension$Longitude*
          N[Degree]; c1 = Cos[R1]; 
        s1 = Sin[R1]; 
        c2 = Cos[R2]; 
        s2 = Sin[R2]; 
        c3 = Cos[R3]; 
        s3 = Sin[R3]; 
        s3c2 = s3*
          c2; c3c2 = 
         c3*c2; 
        a11 = c3*
           c1 - s3c2*
           s1; a12 = 
         -(c3*s1) - 
          s3c2*c1; 
        a21 = s3*
           c1 + c3c2*
           s1; a22 = 
         -(s3*s1) + 
          c3c2*c1; 
        a31 = s2*
          s1; a32 = 
         s2*c1; 
        rot = {{a11, 
           a12}, {a21, 
           a22}, {a31, 
           a32}}; If[SatelliteQ[
          planet], With[{c = 
            0.91739177, s = 0.39798536}, 
          rot = {{a11, 
             a12}, {a21*
               c + a31*
               s, a22*
               c + a32*
               s}, {a31*
               c - a21*
               s, a32*
               c - a22*
               s}}]]; lastROT[
          planet] = {flatdays, 
          day, rot}; ]; 
      rot]
 
getROT /: getROT::trace = ""
 
lastROT[Earth] = {367., -Infinity, Null}
 
lastROT[Jupiter] = {367., -Infinity, Null}
 
lastROT[Mars] = {367., -Infinity, Null}
 
lastROT[Mercury] = {367., -Infinity, Null}
 
lastROT[Moon] = {0.1, -Infinity, Null}
 
lastROT[Venus] = {367., -Infinity, Null}
 
lastROT[_] = {367000., -Infinity, Null}
 
SatelliteQ[planet_] := False
 
SolarAnomaly[d_] := 
    Block[{T = d/36525.}, 
     Mod[357.98304 + 0.9856002669733098*d - 
       T^2*(0.0001505 + T*3.*^-6), 360]]
 
SolarAnomaly /: SolarAnomaly::trace = 
     ""
 
get$theta = CompiledFunction[{8, 8., 5468}, 
     {_Real, _Real, _Real, _Real, _Real}, {{3, 0, 0}, {3, 0, 1}, {3, 0, 2}, 
      {3, 0, 3}, {3, 0, 4}, {3, 0, 31}}, {{3, {2, 0, 1}}, 
      {-0.114336, {3, 0, 24}}, {0.058793, {3, 0, 27}}, 
      {6.288762, {3, 0, 14}}, {0.213616, {3, 0, 16}}, {0.057212, {3, 0, 30}}, 
      {0.030465, {3, 0, 40}}, {0.010674, {3, 0, 48}}, 
      {-1.274007, {3, 0, 20}}, {-0.185596, {3, 0, 22}}, 
      {0.005162, {3, 0, 56}}, {0.041024, {3, 0, 36}}, {0.034718, {3, 0, 38}}, 
      {0.008548, {3, 0, 50}}, {2, {2, 0, 0}}, {0.010034, {3, 0, 18}}, 
      {0.045874, {3, 0, 34}}, {0.012528, {3, 0, 44}}, {0.658306, {3, 0, 21}}, 
      {0.006783, {3, 0, 54}}, {0.01098, {3, 0, 46}}, {0.05332, {3, 0, 32}}, 
      {0.00791, {3, 0, 52}}, {0.017453292519943295, {3, 0, 5}}, 
      {0.015326, {3, 0, 42}}}, {0, 2, 58, 0, 0}, 
     {{16, 3, 5, 6}, {16, 0, 5, 7}, {19, 4, 8}, {13, 1, 8, 9}, {16, 9, 5, 9}, 
      {19, 2, 8}, {13, 1, 8, 10}, {16, 10, 5, 10}, {10, 0, 8}, {16, 8, 9, 8}, 
      {10, 0, 11}, {16, 11, 10, 11}, {19, 8, 12}, {13, 7, 12, 13}, 
      {40, 1, 3, 0, 7, 3, 0, 12}, {16, 14, 12, 15}, {10, 0, 12}, 
      {16, 12, 7, 12}, {40, 1, 3, 0, 12, 3, 0, 17}, {16, 16, 17, 12}, 
      {10, 1, 17}, {16, 17, 7, 17}, {40, 1, 3, 0, 17, 3, 0, 19}, 
      {16, 18, 19, 17}, {13, 0, 15, 12, 17, 19}, {40, 1, 3, 0, 13, 3, 0, 12}, 
      {16, 20, 12, 17}, {40, 1, 3, 0, 8, 3, 0, 15}, {16, 21, 15, 12}, 
      {40, 1, 3, 0, 6, 3, 0, 15}, {16, 22, 15, 23}, {40, 1, 3, 0, 11, 3, 0, 
       15}, {16, 24, 15, 25}, {19, 7, 15}, {19, 6, 26}, {13, 9, 15, 28}, 
      {10, 0, 29}, {16, 29, 28, 29}, {40, 1, 3, 0, 29, 3, 0, 28}, 
      {16, 27, 28, 29}, {13, 8, 26, 15, 28}, {40, 1, 3, 0, 28, 3, 0, 31}, 
      {16, 30, 31, 28}, {13, 8, 7, 31}, {40, 1, 3, 0, 31, 3, 0, 33}, 
      {16, 32, 33, 31}, {13, 8, 26, 33}, {40, 1, 3, 0, 33, 3, 0, 35}, 
      {16, 34, 35, 33}, {13, 7, 26, 35}, {40, 1, 3, 0, 35, 3, 0, 37}, 
      {16, 36, 37, 35}, {40, 1, 3, 0, 9, 3, 0, 37}, {16, 38, 37, 39}, 
      {19, 39, 37}, {13, 7, 6, 39}, {40, 1, 3, 0, 39, 3, 0, 41}, 
      {16, 40, 41, 39}, {19, 39, 41}, {19, 11, 39}, {13, 8, 39, 43}, 
      {40, 1, 3, 0, 43, 3, 0, 39}, {16, 42, 39, 43}, {13, 11, 7, 39}, 
      {40, 1, 3, 0, 39, 3, 0, 45}, {16, 44, 45, 39}, {19, 39, 45}, 
      {13, 11, 15, 39}, {40, 1, 3, 0, 39, 3, 0, 47}, {16, 46, 47, 39}, 
      {19, 39, 47}, {10, 0, 39}, {16, 39, 8, 39}, {13, 39, 15, 39}, 
      {40, 1, 3, 0, 39, 3, 0, 49}, {16, 48, 49, 39}, {13, 8, 15, 49}, 
      {10, 0, 51}, {16, 51, 49, 51}, {40, 1, 3, 0, 51, 3, 0, 49}, 
      {16, 50, 49, 51}, {13, 8, 6, 15, 49}, {40, 1, 3, 0, 49, 3, 0, 53}, 
      {16, 52, 53, 49}, {19, 49, 53}, {13, 8, 6, 49}, 
      {40, 1, 3, 0, 49, 3, 0, 55}, {16, 54, 55, 49}, {19, 49, 55}, 
      {19, 9, 49}, {13, 7, 49, 57}, {40, 1, 3, 0, 57, 3, 0, 49}, 
      {16, 56, 49, 57}, {13, 29, 28, 31, 33, 35, 37, 41, 43, 45, 47, 39, 51, 
       53, 55, 57, 29}, {13, 17, 12, 23, 25, 29, 28}, {13, 19, 28, 31}, 
      {16, 31, 5, 31}, {1}, {1}}, Function[{Mean$Anomaly, 
       Mean$Longitude, 
       Ascension$Longitude, 
       Solar$Anomaly, 
       Solar$Longitude}, 
      Block[{Compile`$34, Compile`$39}, Block[{MS, 
         MD, D1, 
         F1, D2, 
         F2, EV, 
         theta, dtheta, 
         evection, variation, 
         annualeqn, reduction, 
         extra}, MS = 
          Solar$Anomaly*N[Degree]; 
         MD = Mean$Anomaly*N[Degree]; 
         D1 = (Mean$Longitude - 
            Solar$Longitude)*N[Degree]; 
         F1 = (Mean$Longitude - 
            Ascension$Longitude)*N[Degree]; 
         D2 = 2*D1; 
         F2 = 2*F1; 
         EV = MD - 
           D2; theta = 
          Mean$Anomaly + 6.288762*
            Sin[MD] + 0.213616*
            Sin[2*MD] + 0.010034*
            Sin[3*MD]; evection = 
          -1.274007*Sin[EV]; 
         variation = 0.658306*
           Sin[D2]; annualeqn = 
          -0.185596*Sin[MS]; 
         reduction = -0.114336*
           Sin[F2]; extra = 
          (Compile`$34 = -MD; Compile`$39 = 
            -MS; 0.058793*Sin[2*(D1 + 
                Compile`$34)] + 0.057212*Sin[D2 + 
               Compile`$39 + Compile`$34] + 0.05332*
             Sin[D2 + MD] + 
            0.045874*Sin[D2 + Compile`$39] + 
            0.041024*Sin[MD + Compile`$39] - 
            0.034718*Sin[D1] - 0.030465*
             Sin[MD + MS] + 
            0.015326*Sin[D2 - F2] - 
            0.012528*Sin[F2 + MD] - 
            0.01098*Sin[F2 + Compile`$34] + 
            0.010674*Sin[2*D2 + Compile`$34] + 
            0.008548*Sin[2*(D2 + Compile`$34)] - 
            0.00791*Sin[D2 + MS + 
               Compile`$34] - 0.006783*Sin[D2 + 
               MS] + 0.005162*
             Sin[MD - D1]); 
         dtheta = evection + 
           variation + annualeqn + 
           reduction + extra; 
         Return[(theta + dtheta)*
           N[Degree]]]]], Evaluate]
 
Attributes[Compile`$34] = {Temporary}
 
Attributes[Compile`$39] = {Temporary}
 
ObjectQ[Callisto] = True
 
ObjectQ[Ceres] = True
 
ObjectQ[Earth] = True
 
ObjectQ[Europa] = True
 
ObjectQ[Ganymede] = True
 
ObjectQ[Io] = True
 
ObjectQ[Jupiter] = True
 
ObjectQ[Mars] = True
 
ObjectQ[Mercury] = True
 
ObjectQ[Moon] = True
 
ObjectQ[Neptune] = True
 
ObjectQ[Pallas] = True
 
ObjectQ[Pluto] = True
 
ObjectQ[Saturn] = True
 
ObjectQ[Sun] = True
 
ObjectQ[Uranus] = True
 
ObjectQ[Venus] = True
 
ObjectQ[Vesta] = True
 
ObjectQ[planet_] := False
 
Objectxyz[Io, day_] := 
    {jmxyz[1, day, 1], 
     jmxyz[1, day, 2], 
     jmxyz[1, day, 3]}
 
Objectxyz[Europa, day_] := 
    {jmxyz[2, day, 1], 
     jmxyz[2, day, 2], 
     jmxyz[2, day, 3]}
 
Objectxyz[Ganymede, day_] := 
    {jmxyz[3, day, 1], 
     jmxyz[3, day, 2], 
     jmxyz[3, day, 3]}
 
Objectxyz[Callisto, day_] := 
    {jmxyz[4, day, 1], 
     jmxyz[4, day, 2], 
     jmxyz[4, day, 3]}
 
Objectxyz[(object_)?
      spacecraftQ, day_] := 
    trajectory[object][
     day]
 
Objectxyz[planet_, 
     day_] := Block[{Mean$Distance, 
      Mean$Anomaly, Eccentricity, 
      rot, theta, 
      cosTheta, sinTheta, 
      r}, {Mean$Distance, 
        Mean$Anomaly, Eccentricity, 
        rot} = get$orbital$elements[
        planet, day]; 
      theta = true$anomaly[
        Mean$Anomaly, Eccentricity]; 
      cosTheta = Cos[theta]; 
      sinTheta = Sin[theta]; 
      r = Mean$Distance/
        (1 + Eccentricity*cosTheta); 
      rot . {r*
         cosTheta, r*
         sinTheta}]
 
Objectxyz /: Objectxyz::trace = ""
 
jmxyz = CompiledFunction[{8, 8., 5468}, 
     {_Integer, _Real, _Integer}, {{2, 0, 0}, {3, 0, 0}, {2, 0, 1}, 
      {3, 0, 70}}, {{0.0072084, {3, 0, 61}}, {221.647, {3, 0, 17}}, 
      {0.9025179, {3, 0, 18}}, {86.0982, {3, 0, 41}}, {0.472, {3, 0, 44}}, 
      {3, {2, 0, 4}}, {0.845, {3, 0, 67}}, {238.05, {3, 0, 20}}, 
      {0.01672, {3, 0, 24}}, {21.4879802, {3, 0, 64}}, 
      {225.32833, {3, 0, 12}}, {0.0045191, {3, 0, 54}}, {3.07, {3, 0, 36}}, 
      {0.0000109, {3, 0, 62}}, {0.33, {3, 0, 14}}, {311.1, {3, 0, 65}}, 
      {0.00111587, {3, 0, 4}}, {203.405863, {3, 0, 39}}, 
      {101.2916323, {3, 0, 49}}, {44.5, {3, 0, 37}}, {187.3, {3, 0, 58}}, 
      {0.0000935, {3, 0, 69}}, {134.63, {3, 0, 3}}, {0.0126789, {3, 0, 68}}, 
      {0.9856003, {3, 0, 9}}, {0.25192, {3, 0, 28}}, {0.0000117, {3, 0, 47}}, 
      {102.1142308, {3, 0, 52}}, {176.3586, {3, 0, 63}}, 
      {0.0000428, {3, 0, 55}}, {0., {3, 0, 72}}, {0.00577167643528, 
       {3, 0, 35}}, {50.2345169, {3, 0, 57}}, {-0.5, {3, 0, 1}}, 
      {5.20867, {3, 0, 27}}, {223.049, {3, 0, 51}}, {5.552, {3, 0, 30}}, 
      {0.083091, {3, 0, 21}}, {50.310674, {3, 0, 59}}, {1.916, {3, 0, 25}}, 
      {2, {2, 0, 2}}, {358.47583, {3, 0, 8}}, {1, {2, 0, 3}}, 
      {41.5015, {3, 0, 48}}, {1.073, {3, 0, 53}}, {84.5506, {3, 0, 38}}, 
      {1.00014, {3, 0, 23}}, {0.174, {3, 0, 60}}, {0.017453292519943295, 
       {3, 0, 7}}, {109.977, {3, 0, 56}}, {204.2284614, {3, 0, 42}}, 
      {0.0830853, {3, 0, 13}}, {0.0028403, {3, 0, 46}}, 
      {21.569229, {3, 0, 66}}, {4, {2, 0, 5}}}, {3, 6, 73, 0, 0}, 
     {{13, 0, 1, 2}, {16, 4, 2, 5}, {13, 3, 5, 6}, {16, 6, 7, 6}, 
      {40, 1, 3, 0, 6, 3, 0, 5}, {16, 9, 2, 10}, {13, 8, 10, 11}, 
      {16, 11, 7, 11}, {16, 13, 2, 10}, {16, 14, 5, 15}, 
      {13, 12, 10, 15, 16}, {16, 16, 7, 16}, {16, 18, 2, 10}, 
      {16, 14, 5, 15}, {19, 15, 19}, {13, 17, 10, 19, 15}, {16, 15, 7, 15}, 
      {16, 21, 2, 10}, {16, 14, 5, 19}, {13, 20, 10, 19, 22}, 
      {16, 22, 7, 22}, {40, 2, 3, 0, 11, 3, 0, 10}, {16, 24, 10, 19}, 
      {19, 19, 10}, {13, 23, 10, 19}, {40, 1, 3, 0, 11, 3, 0, 10}, 
      {16, 25, 10, 7, 26}, {40, 2, 3, 0, 16, 3, 0, 10}, {16, 28, 10, 29}, 
      {19, 29, 10}, {13, 27, 10, 29}, {40, 1, 3, 0, 16, 3, 0, 10}, 
      {16, 30, 10, 7, 31}, {16, 19, 19, 10}, {16, 29, 29, 32}, {19, 31, 33}, 
      {13, 15, 26, 33, 34}, {40, 2, 3, 0, 34, 3, 0, 33}, {10, 2, 34}, 
      {16, 34, 19, 29, 33, 34}, {19, 34, 33}, {13, 10, 32, 33, 10}, 
      {40, 57, 3, 0, 10, 3, 0, 32}, {16, 35, 32, 33}, {19, 33, 34}, 
      {13, 2, 34, 33}, {16, 37, 7, 34}, {13, 22, 31, 34, 10}, 
      {40, 1, 3, 0, 10, 3, 0, 34}, {16, 36, 34, 7, 10}, 
      {40, 1, 3, 0, 10, 3, 0, 34}, {24, 0, 3, 0}, {2, 0, 18}, 
      {16, 39, 33, 10}, {13, 38, 10, 40}, {16, 40, 7, 40}, {13, 40, 22, 40}, 
      {16, 42, 33, 10}, {13, 41, 10, 43}, {16, 43, 7, 43}, 
      {40, 1, 3, 0, 43, 3, 0, 10}, {16, 44, 10, 45}, {16, 45, 7, 45}, 
      {13, 40, 45, 10}, {7, 10, 40}, {40, 2, 3, 0, 43, 3, 0, 10}, 
      {16, 47, 10, 45}, {19, 45, 10}, {13, 46, 10, 45}, {3, 1}, 
      {24, 0, 2, 0}, {2, 0, 21}, {16, 49, 33, 10}, {13, 48, 10, 50}, 
      {16, 50, 7, 50}, {13, 50, 22, 50}, {7, 50, 40}, {16, 52, 33, 50}, 
      {13, 51, 50, 10}, {16, 10, 7, 10}, {7, 10, 43}, 
      {40, 1, 3, 0, 43, 3, 0, 50}, {16, 53, 50, 10}, {16, 10, 7, 10}, 
      {13, 40, 10, 50}, {7, 50, 40}, {40, 2, 3, 0, 43, 3, 0, 50}, 
      {16, 55, 50, 10}, {19, 10, 50}, {13, 54, 50, 10}, {7, 10, 45}, {3, 1}, 
      {24, 0, 4, 0}, {2, 0, 21}, {16, 57, 33, 10}, {13, 56, 10, 50}, 
      {16, 50, 7, 50}, {13, 50, 22, 50}, {7, 50, 40}, {16, 59, 33, 50}, 
      {13, 58, 50, 10}, {16, 10, 7, 10}, {7, 10, 43}, 
      {40, 1, 3, 0, 43, 3, 0, 50}, {16, 60, 50, 10}, {16, 10, 7, 10}, 
      {13, 40, 10, 50}, {7, 50, 40}, {40, 2, 3, 0, 43, 3, 0, 50}, 
      {16, 62, 50, 10}, {19, 10, 50}, {13, 61, 50, 10}, {7, 10, 45}, {3, 1}, 
      {24, 0, 5, 0}, {2, 0, 21}, {16, 64, 33, 10}, {13, 63, 10, 50}, 
      {16, 50, 7, 50}, {13, 50, 22, 50}, {7, 50, 40}, {16, 66, 33, 50}, 
      {13, 65, 50, 10}, {16, 10, 7, 10}, {7, 10, 43}, 
      {40, 1, 3, 0, 43, 3, 0, 50}, {16, 67, 50, 10}, {16, 10, 7, 10}, 
      {13, 40, 10, 50}, {7, 50, 40}, {40, 2, 3, 0, 43, 3, 0, 50}, 
      {16, 69, 50, 10}, {19, 10, 50}, {13, 68, 50, 10}, {7, 10, 45}, {3, 1}, 
      {24, 1, 3, 0}, {2, 0, 5}, {46, Function[{moon, 
         day, i}, 
        r*Cos[u]], 
       {sinV, 3, 0, 5, Block}, {J, 3, 
        0, 15, Block}, {V, 3, 0, 6, Block}, {RE, 3, 0, 
        19, Block}, {u, 6, 0, 34, Block}, 
       {r, 6, 0, 34, Block}, {L, 3, 0, 22, Block}, 
       {MM, 3, 0, 11, Block}, {Delta, 3, 0, 32, Block}, 
       {A, 3, 0, 26, Block}, {NN, 3, 0, 16, Block}, 
       {sinDe, 3, 0, 34, Block}, {RJ, 
        3, 0, 29, Block}, {d1, 3, 0, 33, Block}, 
       {d, 3, 0, 2, Block}, {B, 3, 0, 
        31, Block}, 2, 0, 0, 3, 0, 0, 2, 0, 1, 3, 0, 10}, {19, 10, 50}, 
      {7, 50, 70}, {3, 16}, {24, 1, 2, 1}, {2, 1, 5}, 
      {46, Function[{moon, day, 
         i}, r*
         Sin[u]], {sinV, 3, 0, 5, 
        Block}, {J, 3, 0, 15, Block}, 
       {V, 3, 0, 6, Block}, {RE, 3, 0, 19, Block}, 
       {u, 6, 0, 34, Block}, {r, 6, 
        0, 34, Block}, {L, 3, 0, 22, Block}, {MM, 3, 0, 
        11, Block}, {Delta, 3, 0, 32, Block}, {A, 3, 0, 26, Block}, 
       {NN, 3, 0, 16, Block}, {sinDe, 
        3, 0, 34, Block}, {RJ, 3, 0, 29, Block}, 
       {d1, 3, 0, 33, Block}, {d, 3, 
        0, 2, Block}, {B, 3, 0, 31, Block}, 2, 0, 0, 3, 
       0, 0, 2, 0, 1, 3, 0, 10}, {19, 10, 70}, {7, 70, 71}, {3, 9}, 
      {24, 1, 4, 2}, {2, 2, 5}, {46, Function[{moon, 
         day, i}, 
        r*Cos[u - L]*
         sinDe], {sinV, 3, 0, 5, 
        Block}, {J, 3, 0, 15, Block}, 
       {V, 3, 0, 6, Block}, {RE, 3, 0, 19, Block}, 
       {u, 6, 0, 34, Block}, {r, 6, 
        0, 34, Block}, {L, 3, 0, 22, Block}, {MM, 3, 0, 
        11, Block}, {Delta, 3, 0, 32, Block}, {A, 3, 0, 26, Block}, 
       {NN, 3, 0, 16, Block}, {sinDe, 
        3, 0, 34, Block}, {RJ, 3, 0, 29, Block}, 
       {d1, 3, 0, 33, Block}, {d, 3, 
        0, 2, Block}, {B, 3, 0, 31, Block}, 2, 0, 0, 3, 
       0, 0, 2, 0, 1, 3, 0, 10}, {19, 10, 71}, {7, 71, 10}, {3, 2}, 
      {7, 72, 10}, {7, 10, 71}, {7, 71, 70}, {1}}, 
     Function[{moon, day, 
       i}, Block[{d, V, 
        sinV, MM, 
        NN, J, L, 
        RE, RJ, A, 
        B, Delta, d1, 
        sinDe, u, 
        p, r}, 
       d = day - 0.5; 
        V = (134.63 + 0.00111587*d)*N[Degree]; 
        sinV = Sin[V]; MM = 
         (358.47583 + 0.9856003*d)*N[Degree]; 
        NN = (225.32833 + 0.0830853*
            d + 0.33*sinV)*N[Degree]; 
        J = (221.647 + 0.9025179*d - 
           0.33*sinV)*N[Degree]; 
        L = (238.05 + 0.083091*d + 
           0.33*sinV)*N[Degree]; RE = 
         1.00014 - 0.01672*Cos[MM]; 
        A = 1.916*Sin[MM]*N[Degree]; 
        RJ = 5.20867 - 0.25192*
           Cos[NN]; B = 
         5.552*Sin[NN]*N[Degree]; 
        Delta = Sqrt[RE*RE + 
           RJ*RJ - 
           2*RE*RJ*
            Cos[J + A - B]]; 
        d1 = d - 
          0.00577167643528*Delta; sinDe = 
         Sin[3.07*Sin[L + B + 44.5*N[Degree]]*N[Degree]]; 
        If[moon == 1, u = 
           (84.5506 + 203.405863*d1)*N[Degree] + L; 
          p = (86.0982 + 204.2284614*
              d1)*N[Degree]; u += 
           (0.472*Sin[p])*N[Degree]; 
          r = 0.0028403 - 0.0000117*
             Cos[p]]; If[moon == 2, 
         u = (41.5015 + 101.2916323*
               d1)*N[Degree] + L; p = 
           (223.049 + 102.1142308*d1)*N[Degree]; 
          u += (1.073*Sin[p])*
            N[Degree]; r = 0.0045191 - 
            0.0000428*Cos[p]]; 
        If[moon == 3, u = 
           (109.977 + 50.2345169*d1)*N[Degree] + L; 
          p = (187.3 + 50.310674*d1)*
            N[Degree]; u += 
           (0.174*Sin[p])*N[Degree]; 
          r = 0.0072084 - 0.0000109*
             Cos[p]]; If[moon == 4, 
         u = (176.3586 + 21.4879802*
               d1)*N[Degree] + L; p = 
           (311.1 + 21.569229*d1)*N[Degree]; 
          u += (0.845*Sin[p])*
            N[Degree]; r = 0.0126789 - 
            0.0000935*Cos[p]]; 
        If[i == 1, -(r*
           Cos[u]), If[i == 2, 
          -(r*Sin[u]), 
          If[i == 3, -(r*
             Cos[u - L]*sinDe), 
           0.]]]]], Evaluate]
 
spacecraftQ[object_] = False
 
get$orbital$elements[planet_, 
     day_] := Block[{d, T, 
      Mean$Longitude, Semi$Major, 
      Perigee$Longitude, 
      Eccentricity, 
      Ascension$Longitude, 
      Orbital$Tilt, Mean$Distance, 
      Mean$Anomaly, Perigee$Argument, 
      rot}, d = 
       day; T = day/36525.; 
      {Mean$Longitude, Semi$Major, 
        Perigee$Longitude, 
        Eccentricity, 
        Ascension$Longitude, 
        Orbital$Tilt} = 
       OrbitalElements[planet, 
        d, T]; Mean$Distance = 
       Semi$Major*(1 - Eccentricity^
          2); Mean$Anomaly = 
       Mod[Mean$Longitude - 
         Perigee$Longitude, 360]; 
      Perigee$Argument = 
       Mod[Perigee$Longitude - 
         Ascension$Longitude, 360]; 
      rot = getROT[
        planet, d, 
        Perigee$Argument, 
        Ascension$Longitude, 
        Orbital$Tilt]; 
      {Mean$Distance, Mean$Anomaly, 
       Eccentricity, rot}]
 
get$orbital$elements /: 
    get$orbital$elements::trace = ""
 
OrbitalElements[Sun, d_, T_] := 
    {0., 0., 0., 0., 0., 0.}
 
OrbitalElements[Mercury, d_, T_] := 
    {Mod[176.13289 + 4.0923770233*d, 360], 0.3870986, 
     75.89968 + 1.55549*T, 0.20561421 + 0.00002046*T, 47.14593 + 1.18521*T, 
     7.00288 + 0.001861*T}
 
OrbitalElements[Venus, d_, T_] := 
    {Mod[341.96597 + 1.6021687039*d, 360], 0.72333162, 
     130.16381 + 1.40804*T, 0.00682069 - 0.00004774*T, 75.77963 + 0.89985*T, 
     3.39363 + 0.001006*T}
 
OrbitalElements[Earth, d_, T_] := 
    {Mod[99.20385 + 0.9856473354*d + 0.0003025*T^2, 360], 
     1.00000023, 101.22081 + T*(1.719173 + T*(0.000453 + T*3.*^-6)), 
     0.01675104 - T*(0.0000418 + T*1.26*^-7), 0, 0}
 
OrbitalElements[Mars, d_, T_] := 
    {Mod[293.4753 + 0.5240710611*d, 360], 1.5236884, 
     334.21818 + 1.84076*T, 0.0933129 + 0.000092064*T, 48.78643 + 0.770992*T, 
     1.85033 - 0.000675*T}
 
OrbitalElements[Jupiter, d_, T_] := 
    {Mod[238.0077 + 0.0831294177*d + 
       0.3314*Sin[2.34976 + 0.71135*T], 360], 5.202803, 12.72 + 1.61*T, 
     0.0485, 99.4434 + 1.011*T, 1.3}
 
OrbitalElements[Saturn, d_, T_] := 
    {Mod[266.5476 + 0.033497875*d + 
       0.8142*Sin[2.34976 + 0.71135*T], 360], 9.53884, 91.0982 + 1.958*T, 
     0.0556, 112.7904 + 0.873*T, 2.49}
 
OrbitalElements[Uranus, d_, T_] := 
    {Mod[243.3 + 0.0117699693*d, 360], 19.1819, 
     171.5487 + 1.484*T, 0.0472, 73.4771 + 0.499*T, 0.77}
 
OrbitalElements[Neptune, d_, T_] := 
    {Mod[85. + 0.0060195028*d, 360], 30.0578, 
     46.7274 + 1.425*T, 0.0086, 130.6814 + 1.099*T, 1.77}
 
OrbitalElements[Pluto, d_, T_] := 
    {Mod[95.3094 + 0.00392312*d, 360], 39.8151, 224.017, 
     0.25515, 110.191, 17.13}
 
OrbitalElements[Ceres, d_, T_] := 
    {Mod[261.25 + 0.214085*d, 360], 2.7674, 151.8, 
     0.0766, 80.7, 10.6}
 
OrbitalElements[Pallas, d_, T_] := 
    {Mod[229.91 + 0.213751*d, 360], 2.7718, 123., 0.2346, 
     173.3, 34.81}
 
OrbitalElements[Vesta, d_, T_] := 
    {Mod[34.42 + 0.271593*d, 360], 2.3617, 253.9, 0.0896, 
     104., 7.13}
 
OrbitalElements[Io, d_, T_] := 
    {Mod[322.59 + (360*d)/1.7691378, 360], 
     (5.91*71942)/149597900, 0, 0., -44.5, 3.14}
 
OrbitalElements[Europa, d_, T_] := 
    {Mod[279.55 + (360*d)/3.55118108, 360], 
     (9.4*71942)/149597900, 0, 0.0003, -44.5, 3.57}
 
OrbitalElements[Ganymede, d_, T_] := 
    {Mod[348.03 + (360*d)/7.15455312, 360], 
     (14.99*71942)/149597900, 0, 0.0015, -44.5, 3.22}
 
OrbitalElements[Callisto, d_, T_] := 
    {Mod[54.409 + (360*d)/16.68901802, 360], 
     (26.36*71942)/149597900, 0, 0.0075, -44.5, 3.97}
 
OrbitalElements[Moon, d_, T_] := 
    {Mod[263.84596 + 13.1763965268*d + 
       T^2*(-0.001133 + 1.9*^-6*T), 360], 384401.6/1.495979*^8, 
     Mod[334.273854 + 0.1114040803*d - 
       T^2*(0.010325 + 0.000012*T), 360], 0.054900489, 
     Mod[259.209752 - 0.0529539222*d + 
       T^2*(0.002078 + 2.*^-6*T), 360], 5.1453964}
 
OrbitalElements[planet_, 
     d_, T_] := (Message[Coordinates::badobject, 
      planet]; {0., 0., 0., 0., 0., 0.})
 
ParentBody[Callisto] = Jupiter
 
ParentBody[Ceres] = Sun
 
ParentBody[Earth] = Sun
 
ParentBody[Europa] = Jupiter
 
ParentBody[Ganymede] = Jupiter
 
ParentBody[Io] = Jupiter
 
ParentBody[Jupiter] = Sun
 
ParentBody[Mars] = Sun
 
ParentBody[Mercury] = Sun
 
ParentBody[Moon] = Earth
 
ParentBody[Neptune] = Sun
 
ParentBody[Pallas] = Sun
 
ParentBody[Pluto] = Sun
 
ParentBody[Saturn] = Sun
 
ParentBody[Sun] = Null
 
ParentBody[Uranus] = Sun
 
ParentBody[Venus] = Sun
 
ParentBody[Vesta] = Sun
 
ParentBody[planet_] := Sun
 
TheStars = {{Andromeda, Beta, 2.06, 17.43, 35.62}, {Andromeda, Alpha, 2.07, 
      2.1, 29.08}, {Andromeda, Gamma1, 2.1, 30.97, 42.33}, 
     {Andromeda, Delta, 3.25, 9.83, 30.87}, {Andromeda, 51, 3.57, 24.5, 
      48.62}, {Andromeda, Omicron, 3.62, 345.48, 42.32}, 
     {Andromeda, Mu, 3.86, 14.19, 38.5}, {Andromeda, Lambda, 3.88, 354.39, 
      46.47}, {Andromeda, Zeta, 4.06, 11.83, 24.27}, 
     {Andromeda, Upsilon, 4.09, 24.2, 41.4}, {Andromeda, Kappa, 4.14, 355.1, 
      44.33}, {Andromeda, Phi, 4.24, 17.37, 47.25}, 
     {Andromeda, Iota, 4.27, 354.53, 43.27}, {Andromeda, Pi, 4.36, 9.22, 
      33.72}, {Andromeda, Epsilon, 4.37, 9.64, 29.32}, 
     {Andromeda, Eta, 4.39, 14.3, 23.42}, {Andromeda, 7, 4.52, 348.14, 
      49.42}, {Andromeda, Nu, 4.52, 12.45, 41.08}, {Andromeda, Sigma, 4.52, 
      4.58, 36.78}, {Andromeda, Theta, 4.6, 4.28, 38.68}, 
     {Andromeda, 3, 4.64, 346.05, 50.05}, {Andromeda, 65, 4.72, 36.4, 50.28}, 
     {Andromeda, 58, 4.8, 32.12, 37.85}, {Andromeda, M31, 4.8, 10.84, 41.28}, 
     {Andromeda, 8, 4.83, 349.43, 49.02}, {Andromeda, 60, 4.83, 33.3, 44.23}, 
     {Andromeda, Omega, 4.83, 21.91, 45.4}, {Andromeda, Xi, 4.87, 20.58, 
      45.52}, {Andromeda, Psi, 4.95, 356.51, 46.42}, 
     {Andromeda, Tau, 4.95, 25.14, 40.57}, {Andromeda, Chi, 4.98, 24.84, 
      44.4}, {Andromeda, 22, 5.03, 2.58, 46.07}, {Andromeda, 41, 5.04, 17., 
      43.95}, {Andromeda, 2, 5.08, 345.65, 42.75}, {Andromeda, Gamma2, 5.08, 
      30.98, 42.33}, {Andromeda, Rho, 5.15, 5.28, 37.97}, 
     {Andromeda, 64, 5.18, 36.1, 50.}, {Andromeda, 28, 5.2, 7.53, 29.75}, 
     {Andromeda, 14, 5.21, 352.82, 39.23}, {Andromeda, 49, 5.26, 22.53, 47.}, 
     {Andromeda, 18, 5.3, 354.78, 50.47}, {Andromeda, 32, 5.3, 10.28, 39.47}, 
     {Andromeda, 4, 5.32, 346.91, 46.38}, {Andromeda, 62, 5.32, 34.82, 
      47.38}, {Andromeda, 55, 5.4, 28.32, 40.73}, {Andromeda, 11, 5.44, 
      349.88, 48.63}, {Andromeda, 36, 5.46, 13.74, 23.62}, 
     {Andromeda, 47, 5.49, 20.92, 37.72}, {Andromeda, 63, 5.58, 35.24, 
      50.17}, {Andromeda, 13, 5.59, 351.78, 42.92}, 
     {Andromeda, 15, 5.6, 353.66, 40.23}, {Andromeda, 23, 5.6, 3.38, 41.03}, 
     {Andromeda, 44, 5.65, 17.58, 42.08}, {Andromeda, 12, 5.66, 350.23, 
      38.18}, {Andromeda, 56, 5.68, 29.04, 37.25}, {Andromeda, 5, 5.73, 
      346.94, 49.3}, {Andromeda, 45, 5.75, 17.79, 37.73}, 
     {Andromeda, 10, 5.77, 349.97, 42.08}, {Antlia, Alpha, 4.24, 156.79, 
      -31.08}, {Antlia, Epsilon, 4.5, 142.31, -35.95}, 
     {Antlia, Iota, 4.59, 164.18, -37.13}, {Antlia, Theta, 4.78, 146.05, 
      -27.77}, {Antlia, Eta, 5.22, 149.72, -35.9}, {Antlia, U, 5.38, 158.8, 
      -39.57}, {Antlia, Delta, 5.55, 157.4, -30.62}, 
     {Apus, Alpha, 3.85, 221.96, -79.03}, {Apus, Gamma, 3.88, 248.36, 
      -78.88}, {Apus, Beta, 4.23, 250.77, -77.52}, {Apus, Delta1, 4.73, 
      245.09, -78.7}, {Apus, Zeta, 4.77, 260.5, -67.77}, 
     {Apus, Eta, 4.9, 214.55, -81.}, {Apus, R, 5., 224.47, -76.65}, 
     {Apus, Epsilon, 5.05, 215.6, -80.12}, {Apus, Delta2, 5.24, 245.11, 
      -78.67}, {Apus, Iota, 5.4, 260.52, -70.12}, {Apus, Kappa1, 5.48, 
      232.88, -73.4}, {Apus, Theta, 5.5, 211.33, -76.8}, 
     {Apus, Kappa2, 5.64, 235.09, -73.45}, {Aquila, Alpha, 0.75, 297.7, 
      8.87}, {Aquila, Gamma, 2.72, 296.56, 10.62}, {Aquila, Zeta, 2.99, 
      286.35, 13.87}, {Aquila, Theta, 3.24, 302.82, -0.82}, 
     {Aquila, Delta, 3.36, 291.37, 3.12}, {Aquila, Lambda, 3.43, 286.56, 
      -4.88}, {Aquila, Eta, 3.5, 298.12, 1.}, {Aquila, Beta, 3.71, 298.83, 
      6.4}, {Aquila, 12, 4.02, 285.42, -5.75}, {Aquila, Epsilon, 4.02, 284.9, 
      15.07}, {Aquila, 71, 4.31, 309.58, -1.1}, {Aquila, Iota, 4.36, 294.18, 
      -1.3}, {Aquila, Mu, 4.44, 293.52, 7.38}, {Aquila, Nu, 4.66, 291.63, 
      0.33}, {Aquila, 70, 4.88, 309.18, -2.55}, {Aquila, 69, 4.9, 307.41, 
      -2.88}, {Aquila, Kappa, 4.95, 294.23, -7.03}, 
     {Aquila, Rho, 4.95, 303.57, 15.2}, {Aquila, 26, 5., 290.14, -5.42}, 
     {Aquila, 4, 5.01, 281.21, 2.05}, {Aquila, 36, 5.02, 292.67, -2.78}, 
     {Aquila, 18, 5.09, 286.74, 11.07}, {Aquila, 23, 5.1, 289.63, 1.08}, 
     {Aquila, 37, 5.11, 293.78, -10.57}, {Aquila, 21, 5.13, 288.43, 2.28}, 
     {Aquila, Omicron, 5.13, 297.75, 10.42}, {Aquila, 31, 5.15, 291.24, 
      11.95}, {Aquila, Sigma, 5.15, 294.8, 5.4}, {Aquila, 19, 5.22, 287.25, 
      6.07}, {Aquila, Chi, 5.22, 295.64, 11.82}, {Aquila, 11, 5.26, 284.77, 
      13.62}, {Aquila, Omega, 5.28, 289.45, 11.6}, 
     {Aquila, Phi, 5.28, 299.06, 11.42}, {Aquila, 20, 5.34, 288.17, -7.93}, 
     {Aquila, FF, 5.4, 284.56, 17.37}, {Aquila, 14, 5.41, 285.73, -3.7}, 
     {Aquila, 15, 5.41, 286.24, -4.03}, {Aquila, 42, 5.45, 294.45, -4.65}, 
     {Aquila, 66, 5.46, 303.31, -1.02}, {Aquila, 27, 5.48, 290.15, -0.9}, 
     {Aquila, R, 5.5, 286.59, 8.23}, {Aquila, Tau, 5.51, 301.03, 7.28}, 
     {Aquila, 28, 5.53, 289.91, 12.37}, {Aquila, 51, 5.55, 297.7, -10.77}, 
     {Aquila, 22, 5.57, 289.13, 4.83}, {Aquila, 58, 5.61, 298.68, 0.28}, 
     {Aquila, Pi, 5.61, 297.17, 11.82}, {Aquila, 45, 5.66, 295.18, -0.62}, 
     {Aquila, 62, 5.67, 301.1, -0.7}, {Aquila, 57, 5.7, 298.66, -8.22}, 
     {Aquila, 56, 5.78, 298.53, -8.57}, {Aquarius, Beta, 2.88, 322.89, 
      -5.58}, {Aquarius, Alpha, 2.93, 331.45, -0.32}, 
     {Aquarius, Delta, 3.27, 343.66, -15.82}, {Aquarius, 88, 3.66, 347.36, 
      -21.17}, {Aquarius, Zeta1, 3.66, 337.21, -0.02}, 
     {Aquarius, Lambda, 3.76, 343.15, -7.58}, {Aquarius, Epsilon, 3.77, 
      311.92, -9.5}, {Aquarius, Gamma, 3.84, 335.41, -1.38}, 
     {Aquarius, 98, 3.96, 350.74, -20.1}, {Aquarius, Tau, 4.01, 342.4, 
      -13.58}, {Aquarius, Eta, 4.02, 338.84, -0.12}, 
     {Aquarius, Theta, 4.15, 334.2, -7.78}, {Aquarius, Phi, 4.22, 348.58, 
      -6.05}, {Aquarius, Psi1, 4.22, 348.97, -9.08}, 
     {Aquarius, Iota, 4.26, 331.61, -13.87}, {Aquarius, 99, 4.39, 351.51, 
      -20.63}, {Aquarius, Psi2, 4.4, 349.47, -9.18}, 
     {Aquarius, 3, 4.41, 311.93, -5.03}, {Aquarius, 86, 4.47, 346.67, 
      -23.75}, {Aquarius, Omega2, 4.48, 355.68, -14.55}, 
     {Aquarius, Nu, 4.51, 317.4, -11.38}, {Aquarius, Pi, 4.66, 336.32, 1.37}, 
     {Aquarius, 66, 4.67, 340.9, -18.83}, {Aquarius, Xi, 4.68, 324.44, 
      -7.85}, {Aquarius, 89, 4.69, 347.47, -22.45}, 
     {Aquarius, Mu, 4.72, 313.17, -8.98}, {Aquarius, Omicron, 4.75, 330.83, 
      -2.15}, {Aquarius, Sigma, 4.83, 337.66, -10.67}, 
     {Aquarius, Psi3, 4.98, 349.74, -9.6}, {Aquarius, Omega1, 5., 354.95, 
      -14.23}, {Aquarius, Kappa, 5.02, 339.44, -4.23}, 
     {Aquarius, Chi, 5.03, 349.21, -7.72}, {Aquarius, 25, 5.09, 324.89, 
      2.25}, {Aquarius, 47, 5.13, 335.4, -21.6}, {Aquarius, 1, 5.16, 309.85, 
      0.48}, {Aquarius, 97, 5.19, 350.66, -15.03}, {Aquarius, Upsilon, 5.2, 
      338.67, -20.7}, {Aquarius, 94, 5.21, 349.78, -13.45}, 
     {Aquarius, 68, 5.26, 341.89, -19.62}, {Aquarius, 32, 5.29, 331.2, -0.9}, 
     {Aquarius, Rho, 5.35, 335.05, -7.82}, {Aquarius, 41, 5.4, 333.57, 
      -21.07}, {Aquarius, 83, 5.43, 346.29, -7.7}, {Aquarius, 38, 5.46, 
      332.66, -11.55}, {Aquarius, 18, 5.48, 321.05, -12.87}, 
     {Aquarius, 21, 5.48, 321.32, -3.55}, {Aquarius, 30, 5.53, 330.82, 
      -6.52}, {Aquarius, 5, 5.54, 313.03, -5.5}, {Aquarius, 42, 5.55, 334.2, 
      -12.83}, {Aquarius, 77, 5.56, 343.69, -16.27}, 
     {Aquarius, 28, 5.57, 330.27, 0.6}, {Aquarius, 49, 5.61, 335.88, -24.77}, 
     {Aquarius, 96, 5.61, 349.85, -5.12}, {Aquarius, 26, 5.67, 325.54, 1.28}, 
     {Aquarius, 7, 5.68, 314.22, -9.7}, {Aquarius, 19, 5.69, 321.3, -9.73}, 
     {Aquarius, 69, 5.7, 341.92, -14.05}, {Aquarius, 35, 5.74, 332.25, 
      -18.53}, {Aquarius, 44, 5.74, 334.27, -5.38}, 
     {Aquarius, 51, 5.77, 336.02, -4.85}, {Ara, Beta, 2.84, 261.32, -55.53}, 
     {Ara, Alpha, 2.94, 262.96, -49.88}, {Ara, Zeta, 3.12, 254.66, -55.98}, 
     {Ara, Gamma, 3.32, 261.35, -56.38}, {Ara, Delta, 3.59, 262.77, -60.68}, 
     {Ara, Theta, 3.67, 271.66, -50.1}, {Ara, Eta, 3.75, 252.45, -59.05}, 
     {Ara, Epsilon1, 4.05, 254.9, -53.15}, {Ara, Sigma, 4.58, 263.92, -46.5}, 
     {Ara, Lambda, 4.76, 265.1, -49.42}, {Ara, Mu, 5.12, 266.03, -51.83}, 
     {Ara, Kappa, 5.22, 261.5, -50.65}, {Ara, Iota, 5.24, 260.82, -47.47}, 
     {Ara, Pi, 5.24, 264.52, -54.5}, {Ara, Epsilon2, 5.36, 255.78, -53.23}, 
     {Aries, Alpha, 2.01, 31.79, 23.45}, {Aries, Beta, 2.63, 28.66, 20.8}, 
     {Aries, 41, 3.61, 42.5, 27.27}, {Aries, Delta, 4.35, 47.91, 19.73}, 
     {Aries, 39, 4.51, 41.98, 29.25}, {Aries, 35, 4.65, 40.86, 27.72}, 
     {Aries, Gamma2, 4.75, 28.38, 19.28}, {Aries, Lambda, 4.77, 29.48, 23.6}, 
     {Aries, Zeta, 4.9, 48.73, 21.03}, {Aries, 14, 4.99, 32.36, 25.93}, 
     {Aries, Kappa, 5.03, 31.64, 22.65}, {Aries, 63, 5.09, 50.69, 20.73}, 
     {Aries, Iota, 5.09, 29.34, 17.82}, {Aries, 38, 5.2, 41.24, 12.43}, 
     {Aries, Eta, 5.23, 33.2, 21.2}, {Aries, Epsilon, 5.25, 44.8, 21.33}, 
     {Aries, Tau, 5.27, 50.31, 21.15}, {Aries, 33, 5.3, 40.17, 27.07}, 
     {Aries, Nu, 5.3, 39.7, 21.97}, {Aries, Pi, 5.34, 42.33, 17.47}, 
     {Aries, Sigma, 5.43, 42.87, 15.08}, {Aries, Xi, 5.49, 36.2, 10.6}, 
     {Aries, Rho, 5.5, 44.11, 18.02}, {Aries, 10, 5.54, 30.92, 25.93}, 
     {Aries, 62, 5.54, 50.55, 27.62}, {Aries, 21, 5.57, 33.93, 25.05}, 
     {Aries, 64, 5.58, 51.08, 24.72}, {Aries, Theta, 5.6, 34.53, 19.9}, 
     {Aries, 31, 5.64, 39.16, 12.45}, {Aries, Mu, 5.66, 40.59, 20.02}, 
     {Aries, 56, 5.67, 48.06, 27.27}, {Aries, Omicron, 5.7, 41.14, 15.3}, 
     {Aries, RR, 5.7, 28.96, 23.57}, {Aries, 55, 5.72, 47.4, 29.08}, 
     {Aries, 19, 5.73, 33.26, 15.28}, {Aries, 4, 5.75, 27.04, 16.95}, 
     {Aries, 15, 5.76, 32.66, 19.5}, {Auriga, Alpha, 0.06, 79.17, 46.}, 
     {Auriga, Beta, 1.9, 89.88, 44.95}, {Auriga, Theta, 2.66, 89.93, 37.2}, 
     {Auriga, Iota, 2.69, 74.25, 33.15}, {Auriga, Epsilon, 2.98, 75.49, 
      43.83}, {Auriga, Eta, 3.17, 76.63, 41.23}, {Auriga, Delta, 3.71, 89.88, 
      54.28}, {Auriga, Nu, 3.98, 87.87, 39.15}, {Auriga, Pi, 4.25, 89.98, 
      45.95}, {Auriga, Kappa, 4.33, 93.84, 29.5}, {Auriga, Tau, 4.51, 87.3, 
      39.18}, {Auriga, 16, 4.54, 79.55, 33.37}, {Auriga, Lambda, 4.71, 79.78, 
      40.1}, {Auriga, Upsilon, 4.74, 87.76, 37.32}, 
     {Auriga, 2, 4.76, 73.16, 36.7}, {Auriga, Chi, 4.76, 83.18, 32.18}, 
     {Auriga, Psi2, 4.79, 99.83, 42.5}, {Auriga, Mu, 4.86, 78.36, 38.48}, 
     {Auriga, 63, 4.91, 107.92, 39.32}, {Auriga, 4, 4.94, 74.81, 37.88}, 
     {Auriga, Xi, 4.95, 88.71, 55.7}, {Auriga, 9, 4.98, 76.67, 51.6}, 
     {Auriga, Sigma, 4.99, 81.16, 37.4}, {Auriga, Psi1, 5., 96.22, 49.28}, 
     {Auriga, Psi7, 5., 102.69, 41.78}, {Auriga, 14, 5.02, 78.85, 32.68}, 
     {Auriga, 19, 5.03, 80., 33.95}, {Auriga, Psi4, 5.03, 100.77, 44.52}, 
     {Auriga, Phi, 5.07, 81.91, 34.47}, {Auriga, 65, 5.12, 110.51, 36.77}, 
     {Auriga, 49, 5.16, 98.8, 28.02}, {Auriga, 66, 5.17, 111.03, 40.67}, 
     {Auriga, Psi3, 5.2, 99.7, 39.9}, {Auriga, Psi6, 5.21, 101.91, 48.8}, 
     {Auriga, Rho, 5.22, 80.45, 41.8}, {Auriga, Psi5, 5.24, 101.68, 43.58}, 
     {Auriga, UU, 5.29, 99.14, 38.45}, {Auriga, AE, 5.3, 79.08, 34.32}, 
     {Auriga, 40, 5.35, 91.65, 38.47}, {Auriga, 45, 5.36, 95.45, 53.45}, 
     {Auriga, 26, 5.4, 84.66, 30.5}, {Auriga, Omicron, 5.43, 86.47, 49.83}, 
     {Auriga, RT, 5.48, 97.14, 30.48}, {Auriga, 51, 5.54, 99.67, 39.4}, 
     {Auriga, WW, 5.6, 98.12, 32.47}, {Auriga, 36, 5.68, 90.24, 47.9}, 
     {Auriga, 64, 5.71, 109.51, 40.88}, {Auriga, Psi9, 5.75, 104.13, 46.27}, 
     {Auriga, 53, 5.76, 99.6, 28.98}, {Bootes, Alpha, -0.11, 213.92, 19.18}, 
     {Bootes, Epsilon, 2.4, 221.25, 27.08}, {Bootes, Eta, 2.68, 208.67, 
      18.4}, {Bootes, Gamma, 3.04, 218.02, 38.32}, {Bootes, Delta, 3.48, 
      228.88, 33.32}, {Bootes, Beta, 3.49, 225.49, 40.38}, 
     {Bootes, Rho, 3.57, 217.96, 30.38}, {Bootes, Upsilon, 4.04, 207.37, 
      15.8}, {Bootes, Theta, 4.05, 216.3, 51.85}, {Bootes, Lambda, 4.18, 
      214.1, 46.08}, {Bootes, Mu1, 4.31, 231.12, 37.38}, 
     {Bootes, Zeta, 4.43, 220.29, 13.72}, {Bootes, Sigma, 4.46, 218.67, 
      29.75}, {Bootes, Tau, 4.5, 206.82, 17.45}, {Bootes, Psi, 4.52, 226.11, 
      26.95}, {Bootes, Kappa, 4.53, 213.37, 51.78}, 
     {Bootes, Omicron, 4.6, 221.31, 16.97}, {Bootes, Xi, 4.61, 222.85, 19.1}, 
     {Bootes, Iota, 4.75, 214.04, 51.37}, {Bootes, I, 4.76, 225.95, 47.67}, 
     {Bootes, Omega, 4.8, 225.53, 25.}, {Bootes, 34, 4.82, 220.86, 26.52}, 
     {Bootes, D, 4.83, 212.6, 25.1}, {Bootes, 20, 4.85, 214.94, 16.32}, 
     {Bootes, 31, 4.86, 220.41, 8.15}, {Bootes, 6, 4.91, 207.43, 21.27}, 
     {Bootes, 45, 4.93, 226.82, 24.88}, {Bootes, Pi1, 4.94, 220.18, 16.42}, 
     {Bootes, Nu2, 4.99, 232.95, 40.9}, {Bootes, 9, 5.01, 209.14, 27.5}, 
     {Bootes, Nu1, 5.03, 232.73, 40.83}, {Bootes, 15, 5.05, 213.71, 10.1}, 
     {Bootes, Phi, 5.24, 234.45, 40.35}, {Bootes, 13, 5.25, 212.07, 49.47}, 
     {Bootes, Chi, 5.26, 228.62, 29.17}, {Bootes, 22, 5.27, 216.61, 19.23}, 
     {Bootes, 33, 5.31, 219.71, 44.4}, {Bootes, 50, 5.37, 230.45, 32.93}, 
     {Bootes, 10, 5.4, 209.66, 21.7}, {Bootes, 18, 5.4, 214.82, 13.}, 
     {Bootes, 14, 5.48, 213.53, 12.97}, {Bootes, 24, 5.49, 217.16, 49.85}, 
     {Bootes, 40, 5.53, 224.9, 39.27}, {Bootes, 32, 5.56, 220.43, 11.65}, 
     {Bootes, 47, 5.56, 226.36, 48.15}, {Bootes, 7, 5.59, 208.3, 17.93}, 
     {Bootes, 39, 5.6, 222.42, 48.72}, {Bootes, 2, 5.63, 205.26, 22.5}, 
     {Bootes, 46, 5.67, 227.1, 26.3}, {Bootes, 38, 5.71, 222.33, 46.12}, 
     {Bootes, 1, 5.78, 205.17, 19.97}, {Caelum, Alpha, 4.43, 70.14, -41.87}, 
     {Caelum, Gamma, 4.54, 76.1, -35.48}, {Caelum, Beta, 5.04, 70.51, 
      -37.13}, {Caelum, Delta, 5.06, 67.71, -44.95}, 
     {Camelopardalis, Beta, 4.04, 75.85, 60.45}, {Camelopardalis, Alpha, 4.3, 
      73.51, 66.33}, {Camelopardalis, 7, 4.43, 74.32, 53.77}, 
     {Camelopardalis, Gamma, 4.65, 57.59, 71.32}, {Camelopardalis, 3, 5.05, 
      69.98, 53.08}, {Camelopardalis, 43, 5.12, 103.43, 68.88}, 
     {Camelopardalis, 16, 5.14, 80.87, 57.55}, {Camelopardalis, 42, 5.15, 
      102.74, 67.57}, {Camelopardalis, TU, 5.2, 88.74, 59.88}, 
     {Camelopardalis, 11, 5.22, 76.54, 58.97}, {Camelopardalis, 4, 5.26, 72., 
      56.77}, {Camelopardalis, 36, 5.32, 93.21, 65.72}, 
     {Camelopardalis, 37, 5.35, 92.5, 58.93}, {Camelopardalis, 2, 5.36, 70., 
      53.48}, {Camelopardalis, 1, 5.4, 68., 53.92}, 
     {Camelopardalis, 40, 5.45, 93.92, 60.}, {Camelopardalis, 5, 5.51, 73.77, 
      55.27}, {Camelopardalis, 17, 5.53, 82.54, 63.07}, 
     {Capricornus, Delta, 2.83, 326.76, -16.13}, {Capricornus, Beta, 3.07, 
      305.25, -14.78}, {Capricornus, Alpha2, 3.56, 304.51, -12.53}, 
     {Capricornus, Gamma, 3.66, 325.02, -16.67}, {Capricornus, Zeta, 3.74, 
      321.67, -22.42}, {Capricornus, Theta, 4.06, 316.49, -17.23}, 
     {Capricornus, Omega, 4.11, 312.95, -26.93}, {Capricornus, Psi, 4.13, 
      311.52, -25.27}, {Capricornus, Alpha1, 4.24, 304.41, -12.5}, 
     {Capricornus, Iota, 4.27, 320.56, -16.83}, {Capricornus, 24, 4.5, 
      316.78, -25.}, {Capricornus, 36, 4.5, 322.18, -21.82}, 
     {Capricornus, Epsilon, 4.67, 324.27, -19.47}, {Capricornus, Kappa, 4.72, 
      325.67, -18.87}, {Capricornus, Nu, 4.75, 305.17, -12.75}, 
     {Capricornus, Rho, 4.77, 307.21, -17.82}, {Capricornus, Eta, 4.83, 
      316.1, -19.85}, {Capricornus, Mu, 5.07, 328.32, -13.55}, 
     {Capricornus, 46, 5.08, 326.25, -9.07}, {Capricornus, Upsilon, 5.1, 
      310.01, -18.13}, {Capricornus, 42, 5.18, 325.39, -14.05}, 
     {Capricornus, 41, 5.24, 325.5, -23.27}, {Capricornus, Phi, 5.24, 318.9, 
      -20.65}, {Capricornus, Pi, 5.25, 306.83, -18.2}, 
     {Capricornus, 29, 5.28, 318.94, -15.17}, {Capricornus, Sigma, 5.28, 
      304.85, -19.12}, {Capricornus, Chi, 5.29, 317.14, -21.2}, 
     {Capricornus, Tau, 5.3, 309.82, -14.95}, {Capricornus, 33, 5.41, 321.04, 
      -20.87}, {Capricornus, 30, 5.43, 319.49, -17.98}, 
     {Capricornus, Lambda, 5.58, 326.63, -11.37}, {Carina, Alpha, -0.72, 
      95.99, -52.68}, {Carina, Beta, 1.68, 138.3, -69.72}, 
     {Carina, Epsilon, 1.88, 125.63, -59.5}, {Carina, Iota, 2.25, 139.28, 
      -59.27}, {Carina, Theta, 2.76, 160.74, -64.38}, 
     {Carina, Upsilon, 3.15, 146.78, -65.07}, {Carina, Omega, 3.31, 153.44, 
      -70.03}, {Carina, L, 3.4, 146.31, -62.52}, {Carina, A, 3.44, 137.74, 
      -58.97}, {Carina, Chi, 3.46, 119.2, -52.98}, {Carina, Eta, 4., 161.27, 
      -59.7}, {Carina, R, 4., 143.06, -62.8}, {Carina, S, 5.35, 152.34, 
      -61.55}, {Cassiopeia, Alpha, 2.22, 10.13, 56.53}, 
     {Cassiopeia, Beta, 2.27, 2.29, 59.15}, {Cassiopeia, Gamma, 2.57, 14.18, 
      60.72}, {Cassiopeia, Delta, 2.68, 21.45, 60.23}, 
     {Cassiopeia, Epsilon, 3.37, 28.6, 63.68}, {Cassiopeia, Eta, 3.44, 12.28, 
      57.82}, {Cassiopeia, Zeta, 3.64, 9.24, 53.9}, 
     {Cassiopeia, 50, 3.95, 30.86, 72.42}, {Cassiopeia, Kappa, 4.16, 8.25, 
      62.93}, {Cassiopeia, Theta, 4.33, 17.78, 55.15}, 
     {Cassiopeia, Iota, 4.49, 37.27, 67.4}, {Cassiopeia, Omicron, 4.54, 
      11.18, 48.28}, {Cassiopeia, Rho, 4.59, 358.6, 57.5}, 
     {Cassiopeia, Upsilon2, 4.62, 14.17, 59.17}, {Cassiopeia, 48, 4.7, 30.49, 
      70.9}, {Cassiopeia, Psi, 4.72, 21.48, 68.12}, 
     {Cassiopeia, Xi, 4.78, 10.52, 50.52}, {Cassiopeia, Lambda, 4.79, 7.94, 
      54.52}, {Cassiopeia, R, 4.8, 359.6, 51.38}, {Cassiopeia, Upsilon1, 
      4.82, 13.75, 58.97}, {Cassiopeia, AR, 4.84, 352.51, 58.55}, 
     {Cassiopeia, 1, 4.86, 346.65, 59.42}, {Cassiopeia, Tau, 4.87, 356.77, 
      58.65}, {Cassiopeia, Sigma, 4.88, 359.75, 55.75}, 
     {Cassiopeia, Nu, 4.9, 12.21, 50.97}, {Cassiopeia, Pi, 4.95, 10.87, 
      47.03}, {Cassiopeia, 4, 4.97, 351.21, 62.28}, 
     {Cassiopeia, Omega, 4.98, 29., 68.68}, {Cassiopeia, Phi, 4.98, 20.02, 
      58.23}, {Cassiopeia, Mu, 5.16, 17.07, 54.92}, 
     {Cassiopeia, 49, 5.17, 31.38, 76.12}, {Cassiopeia, 42, 5.18, 25.73, 
      70.62}, {Cassiopeia, 40, 5.28, 24.63, 73.05}, 
     {Cassiopeia, 47, 5.28, 31.28, 77.28}, {Cassiopeia, 31, 5.29, 17.66, 
      68.78}, {Cassiopeia, 12, 5.4, 6.2, 61.83}, {Cassiopeia, 23, 5.41, 
      11.94, 74.85}, {Cassiopeia, 6, 5.42, 357.21, 62.22}, 
     {Cassiopeia, 32, 5.5, 17.92, 65.02}, {Cassiopeia, 10, 5.56, 1.61, 
      64.18}, {Cassiopeia, 43, 5.57, 25.59, 68.03}, 
     {Cassiopeia, YZ, 5.57, 11.41, 74.98}, {Cassiopeia, 53, 5.58, 30.75, 
      64.38}, {Cassiopeia, 2, 5.75, 347.43, 59.33}, 
     {Cassiopeia, 44, 5.78, 25.83, 60.55}, {Centaurus, Alpha, 0.33, 219.9, 
      -60.83}, {Centaurus, Beta, 0.61, 210.96, -60.37}, 
     {Centaurus, Theta, 2.07, 211.67, -36.38}, {Centaurus, Gamma, 2.16, 
      190.38, -48.97}, {Centaurus, Epsilon, 2.3, 204.97, -53.47}, 
     {Centaurus, Eta, 2.32, 218.88, -42.15}, {Centaurus, Zeta, 2.54, 208.88, 
      -47.3}, {Centaurus, Delta, 2.58, 182.09, -50.72}, 
     {Centaurus, Iota, 2.75, 200.15, -36.72}, {Centaurus, Kappa, 3.13, 
      224.79, -42.1}, {Centaurus, Lambda, 3.13, 173.95, -63.02}, 
     {Centaurus, Nu, 3.41, 207.38, -41.68}, {Centaurus, Mu, 3.47, 207.4, 
      -42.48}, {Centaurus, Phi, 3.82, 209.57, -42.1}, 
     {Centaurus, Tau, 3.85, 189.43, -48.53}, {Centaurus, Upsilon1, 3.86, 
      209.67, -44.8}, {Centaurus, Pi, 3.88, 170.25, -54.5}, 
     {Centaurus, Sigma, 3.92, 187.01, -50.23}, {Centaurus, Rho, 3.96, 182.91, 
      -52.37}, {Centaurus, Psi, 4.04, 215.14, -37.9}, 
     {Centaurus, 2, 4.2, 207.36, -34.45}, {Centaurus, 1, 4.23, 206.42, 
      -33.03}, {Centaurus, Xi2, 4.26, 196.73, -49.9}, 
     {Centaurus, Upsilon2, 4.34, 210.43, -45.6}, {Centaurus, Chi, 4.35, 
      211.51, -41.18}, {Centaurus, 3, 4.72, 207.95, -33.}, 
     {Centaurus, 4, 4.72, 208.3, -31.93}, {Centaurus, NGC5139, 4.8, 201.67, 
      -47.32}, {Centaurus, Xi1, 4.84, 195.89, -49.52}, 
     {Centaurus, Omicron1, 5.11, 172.95, -59.43}, {Centaurus, Omicron2, 5.17, 
      172.95, -59.52}, {Centaurus, R, 5.3, 214.14, -59.92}, 
     {Centaurus, T, 5.6, 205.44, -33.6}, {Cepheus, Alpha, 2.44, 319.65, 
      62.58}, {Cepheus, Beta, 3.18, 322.16, 70.55}, 
     {Cepheus, Gamma, 3.22, 354.83, 77.62}, {Cepheus, Zeta, 3.35, 332.71, 
      58.2}, {Cepheus, Eta, 3.42, 311.32, 61.83}, {Cepheus, Iota, 3.5, 
      342.42, 66.2}, {Cepheus, Mu, 3.99, 325.88, 58.78}, 
     {Cepheus, Epsilon, 4.19, 333.76, 57.05}, {Cepheus, Theta, 4.21, 307.4, 
      62.98}, {Cepheus, Nu, 4.28, 326.36, 61.13}, {Cepheus, Xi, 4.29, 330.95, 
      64.62}, {Cepheus, Delta, 4.34, 337.29, 58.42}, 
     {Cepheus, Kappa, 4.37, 302.22, 77.72}, {Cepheus, Pi, 4.41, 346.98, 
      75.38}, {Cepheus, 11, 4.55, 325.48, 71.32}, {Cepheus, 9, 4.74, 324.48, 
      62.08}, {Cepheus, Omicron, 4.74, 349.66, 68.12}, 
     {Cepheus, 24, 4.78, 332.45, 72.35}, {Cepheus, VV, 4.9, 329.16, 63.63}, 
     {Cepheus, 16, 5.03, 329.81, 73.18}, {Cepheus, Lambda, 5.04, 332.88, 
      59.42}, {Cepheus, 31, 5.07, 338.94, 73.63}, {Cepheus, 19, 5.11, 331.29, 
      62.28}, {Cepheus, 6, 5.17, 319.84, 64.87}, {Cepheus, T, 5.2, 317.38, 
      68.48}, {Cepheus, 30, 5.21, 339.66, 63.58}, {Cepheus, 20, 5.27, 331.25, 
      62.78}, {Cepheus, 18, 5.28, 330.97, 63.12}, {Cepheus, 7, 5.4, 321.94, 
      66.8}, {Cepheus, 12, 5.44, 326.85, 60.7}, {Cepheus, 26, 5.46, 336.77, 
      65.13}, {Cepheus, Rho, 5.52, 337.47, 78.83}, {Cepheus, 4, 5.53, 310.8, 
      66.67}, {Cepheus, 14, 5.56, 330.52, 58.}, {Cepheus, 28, 5.77, 336.68, 
      78.8}, {Cepheus, 25, 5.78, 334.55, 62.8}, {Cetus, Omicron, 2., 34.84, 
      -2.98}, {Cetus, Beta, 2.03, 10.9, -17.98}, {Cetus, Alpha, 2.52, 45.57, 
      4.1}, {Cetus, Eta, 3.44, 17.15, -10.18}, {Cetus, Gamma, 3.46, 40.82, 
      3.23}, {Cetus, Tau, 3.5, 26.02, -15.93}, {Cetus, Iota, 3.54, 4.86, 
      -8.83}, {Cetus, Theta, 3.6, 21., -8.18}, {Cetus, Zeta, 3.72, 27.86, 
      -10.33}, {Cetus, Upsilon, 3.99, 30., -21.08}, 
     {Cetus, Delta, 4.06, 39.87, 0.33}, {Cetus, Pi, 4.24, 41.03, -13.87}, 
     {Cetus, Mu, 4.26, 41.23, 10.12}, {Cetus, Xi2, 4.27, 37.04, 8.47}, 
     {Cetus, Xi1, 4.36, 33.25, 8.85}, {Cetus, 7, 4.4, 3.66, -18.93}, 
     {Cetus, 2, 4.54, 0.93, -17.35}, {Cetus, Chi, 4.64, 27.4, -10.68}, 
     {Cetus, 1, 4.75, 11.05, -10.6}, {Cetus, Sigma, 4.75, 38.02, -15.25}, 
     {Cetus, 20, 4.77, 13.25, -1.13}, {Cetus, Epsilon, 4.84, 39.89, -11.88}, 
     {Cetus, Kappa, 4.84, 49.84, 3.37}, {Cetus, 56, 4.85, 29.17, -22.53}, 
     {Cetus, Nu, 4.87, 38.97, 5.58}, {Cetus, 6, 4.88, 2.81, -15.47}, 
     {Cetus, Rho, 4.88, 36.49, -12.28}, {Cetus, 46, 4.89, 21.4, -14.6}, 
     {Cetus, T, 5., 5.45, -20.07}, {Cetus, 94, 5.06, 48.19, -1.2}, 
     {Cetus, 37, 5.11, 18.6, -7.93}, {Cetus, 48, 5.11, 22.4, -21.63}, 
     {Cetus, 3, 5.16, 1.12, -10.52}, {Cetus, 2, 5.19, 12.53, -10.65}, 
     {Cetus, 13, 5.2, 8.81, -3.6}, {Cetus, 69, 5.27, 35.48, 0.38}, 
     {Cetus, 3, 5.3, 14.01, -11.27}, {Cetus, 75, 5.34, 38.04, -1.05}, 
     {Cetus, 50, 5.39, 24., -15.4}, {Cetus, 39, 5.4, 19.15, -2.5}, 
     {Cetus, 25, 5.41, 15.76, -4.83}, {Cetus, 57, 5.41, 29.94, -20.83}, 
     {Cetus, 70, 5.41, 35.55, -0.88}, {Cetus, 95, 5.41, 49.59, -0.93}, 
     {Cetus, 60, 5.43, 30.8, 0.13}, {Cetus, 67, 5.5, 34.25, -6.42}, 
     {Cetus, 80, 5.52, 39., -7.83}, {Cetus, 28, 5.57, 16.52, -9.85}, 
     {Cetus, 49, 5.61, 23.66, -15.67}, {Cetus, 64, 5.62, 32.84, 8.57}, 
     {Cetus, 93, 5.62, 45.59, 4.37}, {Cetus, 81, 5.64, 39.42, -3.4}, 
     {Cetus, 66, 5.67, 33.2, -2.4}, {Cetus, 47, 5.68, 21.72, -13.07}, 
     {Cetus, 97, 5.68, 50.28, 3.68}, {Cetus, 38, 5.69, 18.7, -0.98}, 
     {Cetus, 84, 5.7, 40.31, -0.7}, {Cetus, 12, 5.71, 7.51, -3.97}, 
     {Cetus, 77, 5.74, 38.68, -7.87}, {Chamaeleon, Alpha, 4.06, 124.63, 
      -76.92}, {Chamaeleon, Gamma, 4.14, 158.87, -78.6}, 
     {Chamaeleon, Beta, 4.27, 184.58, -79.3}, {Chamaeleon, Theta, 4.34, 
      125.16, -77.48}, {Chamaeleon, Delta2, 4.44, 161.45, -80.55}, 
     {Chamaeleon, Epsilon, 4.9, 179.9, -78.22}, {Chamaeleon, Kappa, 5.03, 
      181.2, -76.52}, {Chamaeleon, Zeta, 5.1, 143.47, -80.95}, 
     {Chamaeleon, Iota, 5.36, 141.04, -80.78}, {Chamaeleon, Nu, 5.44, 146.59, 
      -76.78}, {Chamaeleon, Delta1, 5.46, 161.32, -80.47}, 
     {Chamaeleon, Eta, 5.46, 130.33, -78.97}, {Chamaeleon, Mu, 5.51, 150.18, 
      -82.22}, {Chamaeleon, Pi, 5.64, 174.32, -75.9}, 
     {Circinus, Alpha, 3.18, 220.62, -64.97}, {Circinus, Beta, 4.06, 229.38, 
      -58.8}, {Circinus, Gamma, 4.5, 230.85, -59.33}, 
     {Circinus, Epsilon, 4.85, 229.41, -63.6}, {Circinus, Delta, 5.08, 
      229.24, -60.95}, {Circinus, Eta, 5.2, 226.2, -64.03}, 
     {Circinus, Theta, 5.42, 224.18, -62.77}, {CanisMajor, Alpha, -1.46, 
      101.29, -16.72}, {CanisMajor, Epsilon, 1.5, 104.66, -28.97}, 
     {CanisMajor, Delta, 1.84, 107.1, -26.4}, {CanisMajor, Beta, 1.98, 95.67, 
      -17.95}, {CanisMajor, Eta, 2.44, 111.02, -29.3}, 
     {CanisMajor, Zeta, 3.02, 95.08, -30.07}, {CanisMajor, Omicron2, 3.03, 
      105.76, -23.83}, {CanisMajor, Sigma, 3.46, 105.43, -27.93}, 
     {CanisMajor, Omega, 3.82, 108.7, -26.77}, {CanisMajor, Omicron1, 3.86, 
      103.53, -24.2}, {CanisMajor, Kappa, 3.94, 102.46, -32.52}, 
     {CanisMajor, Nu2, 3.94, 99.17, -19.25}, {CanisMajor, Theta, 4.06, 
      103.55, -12.05}, {CanisMajor, Gamma, 4.11, 105.94, -15.63}, 
     {CanisMajor, Xi1, 4.34, 97.96, -23.42}, {CanisMajor, Iota, 4.38, 104.04, 
      -17.05}, {CanisMajor, Tau, 4.39, 109.68, -24.95}, 
     {CanisMajor, Nu3, 4.41, 99.47, -18.23}, {CanisMajor, 27, 4.42, 108.57, 
      -26.35}, {CanisMajor, Lambda, 4.47, 97.04, -32.58}, 
     {CanisMajor, Xi2, 4.54, 98.76, -22.97}, {CanisMajor, Pi, 4.66, 103.9, 
      -20.15}, {CanisMajor, 15, 4.82, 103.38, -20.22}, 
     {CanisMajor, UW, 4.95, 109.67, -24.57}, {CanisMajor, Mu, 4.99, 104.03, 
      -14.05}, {CanisMajor, 10, 5.16, 101.12, -31.07}, 
     {CanisMajor, 11, 5.28, 101.71, -14.42}, {CanisMajor, R, 5.4, 109.87, 
      -16.38}, {CanisMajor, Nu1, 5.52, 99.1, -18.67}, 
     {CanisMajor, 17, 5.75, 103.76, -20.42}, {CanisMinor, Alpha, 0.36, 
      114.83, 5.23}, {CanisMinor, Beta, 2.89, 111.79, 8.28}, 
     {CanisMinor, Gamma, 4.32, 112.04, 8.93}, {CanisMinor, 6, 4.53, 112.45, 
      12.02}, {CanisMinor, Epsilon, 5., 111.41, 9.27}, 
     {CanisMinor, Zeta, 5.14, 117.93, 1.77}, {CanisMinor, Eta, 5.23, 112.01, 
      6.95}, {CanisMinor, Delta1, 5.24, 113.02, 1.92}, 
     {CanisMinor, 14, 5.29, 119.59, 2.22}, {CanisMinor, 1, 5.3, 111.24, 
      11.67}, {CanisMinor, 11, 5.3, 116.57, 10.77}, 
     {CanisMinor, Delta2, 5.58, 113.3, 3.28}, {Cancer, Beta, 3.52, 124.13, 
      9.2}, {Cancer, M44, 3.7, 130.11, 19.98}, {Cancer, Delta, 3.93, 131.17, 
      18.15}, {Cancer, Iota, 4.03, 131.67, 28.77}, {Cancer, Alpha, 4.23, 
      134.62, 11.87}, {Cancer, Gamma, 4.67, 130.82, 21.47}, 
     {Cancer, 8, 5.11, 121.27, 13.12}, {Cancer, Chi, 5.13, 125.01, 27.22}, 
     {Cancer, Xi, 5.14, 137.34, 22.05}, {Cancer, Omicron, 5.2, 134.31, 
      15.32}, {Cancer, Rho2, 5.21, 133.91, 27.93}, {Cancer, Kappa, 5.23, 
      136.94, 10.67}, {Cancer, Mu, 5.3, 121.94, 21.58}, 
     {Cancer, Eta, 5.33, 128.18, 20.45}, {Cancer, Theta, 5.35, 127.9, 18.1}, 
     {Cancer, Pi, 5.36, 138.81, 14.93}, {Cancer, Nu, 5.42, 135.69, 24.45}, 
     {Cancer, Tau, 5.42, 137., 29.65}, {Cancer, Sigma2, 5.45, 134.23, 32.92}, 
     {Cancer, Sigma3, 5.46, 134.88, 32.42}, {Cancer, 57, 5.47, 133.56, 
      30.57}, {Cancer, 27, 5.5, 126.68, 12.65}, {Cancer, 3, 5.55, 120.2, 
      17.32}, {Cancer, 60, 5.56, 133.98, 11.62}, {Cancer, Zeta1, 5.56, 
      123.05, 17.65}, {Cancer, 1, 5.63, 126.62, 27.88}, 
     {Cancer, 15, 5.63, 123.29, 29.65}, {Cancer, 50, 5.63, 131.73, 12.12}, 
     {Cancer, Upsilon1, 5.65, 127.88, 24.08}, {Cancer, 49, 5.66, 131.19, 
      10.08}, {Cancer, 63, 5.67, 134.4, 15.58}, {Cancer, 45, 5.68, 130.8, 
      12.67}, {Cancer, Psi, 5.73, 122.61, 25.52}, {Cancer, Omega, 5.75, 
      120.23, 25.4}, {Cancer, Sigma1, 5.76, 133.15, 32.48}, 
     {Columba, Alpha, 2.63, 84.91, -34.08}, {Columba, Beta, 3.11, 87.74, 
      -35.77}, {Columba, Delta, 3.84, 95.53, -33.43}, 
     {Columba, Epsilon, 3.86, 82.8, -35.48}, {Columba, Eta, 3.95, 89.79, 
      -42.82}, {Columba, Gamma, 4.36, 89.39, -35.28}, 
     {Columba, Kappa, 4.36, 94.14, -35.13}, {Columba, Omicron, 4.81, 79.37, 
      -34.9}, {Columba, Lambda, 4.87, 88.28, -33.8}, 
     {Columba, Xi, 4.96, 88.87, -37.12}, {Columba, Theta, 5.01, 91.88, 
      -37.25}, {Columba, Mu, 5.17, 86.5, -32.32}, {Columba, Nu2, 5.28, 84.43, 
      -28.68}, {Columba, Pi2, 5.48, 91.97, -42.15}, 
     {Columba, Sigma, 5.54, 89.09, -31.38}, {ComaBerenices, Beta, 4.26, 
      197.97, 27.88}, {ComaBerenices, Gamma, 4.35, 186.73, 28.27}, 
     {ComaBerenices, 11, 4.73, 185.18, 17.8}, {ComaBerenices, 36, 4.77, 
      194.73, 17.42}, {ComaBerenices, 41, 4.8, 196.8, 27.63}, 
     {ComaBerenices, 12, 4.81, 185.63, 25.85}, {ComaBerenices, 23, 4.81, 
      188.71, 22.63}, {ComaBerenices, 37, 4.89, 195.07, 30.78}, 
     {ComaBerenices, 14, 4.93, 186.6, 27.27}, {ComaBerenices, 35, 4.93, 
      193.32, 21.23}, {ComaBerenices, 7, 4.94, 184.08, 23.95}, 
     {ComaBerenices, 31, 4.94, 192.93, 27.53}, {ComaBerenices, 16, 4.99, 
      186.75, 26.83}, {ComaBerenices, 24, 5.02, 188.77, 18.38}, 
     {ComaBerenices, 6, 5.09, 184., 14.9}, {ComaBerenices, 27, 5.12, 191.66, 
      16.57}, {ComaBerenices, 13, 5.17, 186.08, 26.1}, 
     {ComaBerenices, Alpha, 5.22, 197.5, 17.52}, {ComaBerenices, 17, 5.29, 
      187.23, 25.92}, {ComaBerenices, 26, 5.39, 189.78, 21.07}, 
     {ComaBerenices, 21, 5.45, 187.75, 24.57}, {ComaBerenices, 18, 5.48, 
      187.36, 24.12}, {ComaBerenices, 5, 5.56, 183.04, 20.55}, 
     {ComaBerenices, 40, 5.62, 196.6, 22.62}, {ComaBerenices, 4, 5.63, 
      182.96, 25.88}, {ComaBerenices, 25, 5.68, 189.24, 17.08}, 
     {ComaBerenices, 2, 5.7, 181.07, 21.47}, {ComaBerenices, 20, 5.72, 
      187.43, 20.9}, {ComaBerenices, 29, 5.75, 192.23, 14.12}, 
     {CoronaAustralis, Alpha, 4.1, 287.37, -37.92}, 
     {CoronaAustralis, Beta, 4.1, 287.51, -39.33}, {CoronaAustralis, Gamma, 
      4.2, 286.6, -37.05}, {CoronaAustralis, Delta, 4.58, 287.08, -40.5}, 
     {CoronaAustralis, Theta, 4.63, 278.38, -42.32}, 
     {CoronaAustralis, Zeta, 4.74, 285.78, -42.1}, {CoronaAustralis, Epsilon, 
      4.87, 284.68, -37.1}, {CoronaAustralis, Lambda, 5.13, 280.94, -38.32}, 
     {CoronaAustralis, Mu, 5.23, 281.93, -40.42}, {CoronaAustralis, Eta1, 
      5.48, 282.21, -43.67}, {CoronaAustralis, Eta2, 5.64, 282.39, -43.43}, 
     {CoronaBorealis, T, 2., 239.88, 25.92}, {CoronaBorealis, Alpha, 2.23, 
      233.67, 26.72}, {CoronaBorealis, Beta, 3.67, 231.95, 29.1}, 
     {CoronaBorealis, Gamma, 3.82, 235.69, 26.3}, {CoronaBorealis, Epsilon, 
      4.14, 239.4, 26.88}, {CoronaBorealis, Theta, 4.16, 233.23, 31.37}, 
     {CoronaBorealis, Delta, 4.62, 237.4, 26.07}, {CoronaBorealis, Tau, 4.78, 
      242.24, 36.5}, {CoronaBorealis, Kappa, 4.81, 237.81, 35.65}, 
     {CoronaBorealis, Xi, 4.85, 245.53, 30.88}, {CoronaBorealis, Iota, 4.99, 
      240.36, 29.85}, {CoronaBorealis, Zeta2, 5.07, 234.85, 36.65}, 
     {CoronaBorealis, Mu, 5.13, 233.81, 39.02}, {CoronaBorealis, Nu1, 5.2, 
      245.59, 33.8}, {CoronaBorealis, Nu2, 5.39, 245.62, 33.7}, 
     {CoronaBorealis, Rho, 5.41, 240.26, 33.3}, {CoronaBorealis, Pi, 5.43, 
      236., 32.52}, {CoronaBorealis, Lambda, 5.45, 238.95, 37.95}, 
     {CoronaBorealis, Omicron, 5.5, 230.04, 29.62}, 
     {CoronaBorealis, Eta, 5.58, 230.8, 30.28}, {CoronaBorealis, Sigma, 5.76, 
      243.67, 33.87}, {Crater, Delta, 3.56, 169.83, -14.77}, 
     {Crater, Gamma, 4.06, 171.22, -17.68}, {Crater, Alpha, 4.07, 164.94, 
      -18.3}, {Crater, Beta, 4.47, 167.91, -22.83}, 
     {Crater, Zeta, 4.72, 176.19, -18.35}, {Crater, Theta, 4.75, 174.17, 
      -9.8}, {Crater, Epsilon, 4.81, 171.15, -10.87}, 
     {Crater, Lambda, 5.08, 170.84, -18.78}, {Crater, Eta, 5.17, 179., 
      -17.15}, {Crater, Iota, 5.48, 174.67, -13.2}, 
     {Crux, Alpha1, 0.8, 186.65, -63.1}, {Crux, Beta, 1.27, 191.93, -59.7}, 
     {Crux, Gamma, 1.66, 187.79, -57.12}, {Crux, Alpha2, 2.09, 186.65, 
      -63.1}, {Crux, Delta, 2.81, 183.79, -58.75}, {Crux, Epsilon, 3.59, 
      185.34, -60.4}, {Crux, Mu1, 4.03, 193.65, -57.18}, 
     {Crux, Zeta, 4.06, 184.61, -64.}, {Crux, Eta, 4.14, 181.72, -64.6}, 
     {Crux, Theta1, 4.32, 180.76, -63.3}, {Crux, Lambda, 4.63, 193.66, 
      -59.15}, {Crux, Theta2, 4.71, 181.08, -63.17}, 
     {Crux, Iota, 4.72, 191.41, -60.98}, {Crux, Mu2, 5.18, 193.65, -57.18}, 
     {Corvus, Gamma, 2.59, 183.95, -17.53}, {Corvus, Beta, 2.67, 188.6, 
      -23.4}, {Corvus, Delta, 2.95, 187.46, -16.52}, 
     {Corvus, Epsilon, 2.99, 182.53, -22.62}, {Corvus, Alpha, 4.03, 182.1, 
      -24.72}, {Corvus, Eta, 4.3, 188.02, -16.2}, {Corvus, Zeta, 5.25, 
      185.14, -22.22}, {Corvus, 3, 5.45, 182.77, -23.6}, 
     {Corvus, 6, 5.67, 185.84, -24.83}, {CanesVenatici, Alpha2, 2.88, 194.01, 
      38.32}, {CanesVenatici, Beta, 4.27, 188.44, 41.35}, 
     {CanesVenatici, 24, 4.65, 203.61, 49.02}, {CanesVenatici, 20, 4.72, 
      199.39, 40.57}, {CanesVenatici, 5, 4.77, 186., 51.57}, 
     {CanesVenatici, 25, 4.83, 204.37, 36.28}, {CanesVenatici, Psi, 4.86, 
      191.28, 45.43}, {CanesVenatici, 6, 5.01, 186.46, 39.02}, 
     {CanesVenatici, 21, 5.14, 199.56, 49.67}, {CanesVenatici, 14, 5.2, 
      196.44, 35.8}, {CanesVenatici, 3, 5.31, 184.95, 48.98}, 
     {CanesVenatici, 23, 5.55, 200.08, 40.15}, {CanesVenatici, 19, 5.59, 
      198.88, 40.85}, {CanesVenatici, 2, 5.6, 184.03, 40.67}, 
     {CanesVenatici, Alpha1, 5.61, 194., 38.32}, {Cygnus, Alpha, 1.25, 
      310.36, 45.27}, {Cygnus, Gamma, 2.21, 305.55, 40.25}, 
     {Cygnus, Epsilon, 2.46, 311.55, 33.97}, {Cygnus, Delta, 2.87, 296.24, 
      45.13}, {Cygnus, Beta, 3.08, 292.68, 27.97}, {Cygnus, Zeta, 3.19, 
      318.23, 30.23}, {Cygnus, Xi, 3.72, 316.23, 43.93}, 
     {Cygnus, Tau, 3.73, 318.7, 38.05}, {Cygnus, Iota, 3.77, 292.43, 51.73}, 
     {Cygnus, Kappa, 3.77, 289.28, 53.37}, {Cygnus, Omicron1, 3.78, 303.41, 
      46.73}, {Cygnus, Eta, 3.89, 299.75, 35.08}, {Cygnus, Nu, 3.93, 314.3, 
      41.17}, {Cygnus, Omicron2, 3.98, 303.87, 47.7}, 
     {Cygnus, Chi, 4., 297.64, 32.92}, {Cygnus, 41, 4.01, 307.35, 30.37}, 
     {Cygnus, Rho, 4.02, 323.5, 45.6}, {Cygnus, 52, 4.2, 311.42, 30.72}, 
     {Cygnus, Pi2, 4.23, 326.7, 49.32}, {Cygnus, Sigma, 4.23, 319.35, 39.4}, 
     {Cygnus, 33, 4.28, 303.35, 56.57}, {Cygnus, 39, 4.42, 305.97, 32.18}, 
     {Cygnus, Upsilon, 4.46, 319.48, 34.9}, {Cygnus, Theta, 4.49, 294.11, 
      50.22}, {Cygnus, Lambda, 4.52, 311.85, 36.48}, 
     {Cygnus, 63, 4.53, 316.65, 47.65}, {Cygnus, 59, 4.55, 314.95, 47.52}, 
     {Cygnus, 47, 4.6, 308.47, 35.25}, {Cygnus, Phi, 4.65, 294.85, 30.15}, 
     {Cygnus, Pi1, 4.67, 325.53, 51.18}, {Cygnus, 8, 4.73, 292.94, 34.45}, 
     {Cygnus, Mu1, 4.73, 326.03, 28.73}, {Cygnus, 57, 4.78, 313.31, 44.4}, 
     {Cygnus, 30, 4.83, 303.32, 46.82}, {Cygnus, 55, 4.83, 312.23, 46.12}, 
     {Cygnus, P, 4.83, 304.45, 38.03}, {Cygnus, 72, 4.88, 323.69, 38.53}, 
     {Cygnus, 15, 4.9, 296.07, 37.35}, {Cygnus, Psi, 4.91, 298.91, 52.43}, 
     {Cygnus, 22, 4.94, 298.96, 38.48}, {Cygnus, 28, 4.94, 302.36, 36.85}, 
     {Cygnus, 29, 4.94, 303.63, 36.8}, {Cygnus, Omega1, 4.95, 307.52, 48.95}, 
     {Cygnus, 2, 4.97, 291.03, 29.63}, {Cygnus, 68, 4.98, 319.61, 43.93}, 
     {Cygnus, 17, 4.99, 296.61, 33.73}, {Cygnus, 20, 5.03, 297.65, 52.98}, 
     {Cygnus, 74, 5.03, 324.24, 40.42}, {Cygnus, 26, 5.05, 300.34, 50.12}, 
     {Cygnus, 56, 5.05, 312.52, 44.07}, {Cygnus, 75, 5.1, 325.05, 43.27}, 
     {Cygnus, W, 5.1, 324.01, 45.38}, {Cygnus, Beta, 5.11, 292.69, 27.97}, 
     {Cygnus, 23, 5.12, 298.32, 57.53}, {Cygnus, 4, 5.13, 291.54, 36.32}, 
     {Cygnus, 35, 5.17, 304.66, 34.98}, {Cygnus, 19, 5.2, 297.64, 38.72}, 
     {Cygnus, 25, 5.2, 299.98, 37.03}, {Cygnus, 61, 5.23, 316.73, 38.73}, 
     {Cygnus, 71, 5.23, 322.36, 46.53}, {Cygnus, 70, 5.3, 321.84, 37.12}, 
     {Cygnus, 9, 5.32, 293.71, 29.47}, {Cygnus, 27, 5.36, 301.59, 35.98}, 
     {Cygnus, 60, 5.37, 315.29, 46.17}, {Cygnus, 51, 5.38, 310.55, 50.35}, 
     {Cygnus, 14, 5.4, 294.86, 42.82}, {Cygnus, Omega2, 5.42, 307.83, 49.22}, 
     {Cygnus, 7, 5.56, 291.86, 52.32}, {Cygnus, 36, 5.56, 304.62, 37.}, 
     {Cygnus, 49, 5.6, 310.26, 32.3}, {Cygnus, 79, 5.62, 325.85, 38.28}, 
     {Cygnus, 40, 5.63, 306.89, 38.45}, {Cygnus, DT, 5.7, 316.62, 31.18}, 
     {Cygnus, 77, 5.73, 325.59, 41.07}, {Cygnus, 11, 5.78, 293.95, 36.93}, 
     {Cygnus, 43, 5.78, 306.76, 49.38}, {Delphinus, Beta, 3.58, 309.39, 
      14.6}, {Delphinus, Alpha, 3.77, 309.91, 15.92}, 
     {Delphinus, Epsilon, 4.03, 308.3, 11.3}, {Delphinus, Gamma2, 4.27, 
      311.66, 16.13}, {Delphinus, Delta, 4.42, 310.86, 15.08}, 
     {Delphinus, Zeta, 4.66, 308.83, 14.68}, {Delphinus, Kappa, 5.05, 309.78, 
      10.08}, {Delphinus, Gamma1, 5.14, 311.66, 16.13}, 
     {Delphinus, 17, 5.16, 313.9, 13.72}, {Delphinus, Eta, 5.38, 308.49, 
      13.03}, {Delphinus, Iota, 5.44, 309.45, 11.38}, 
     {Delphinus, 16, 5.54, 313.91, 12.57}, {Delphinus, 13, 5.57, 311.95, 6.}, 
     {Delphinus, U, 5.6, 311.37, 18.1}, {Delphinus, Theta, 5.72, 309.68, 
      13.32}, {Dorado, Alpha, 3.26, 68.5, -55.05}, {Dorado, Beta, 3.4, 83.4, 
      -62.48}, {Dorado, Gamma, 4.24, 64., -51.48}, {Dorado, Delta, 4.34, 
      86.2, -65.73}, {Dorado, Zeta, 4.71, 76.38, -57.48}, 
     {Dorado, Theta, 4.82, 78.44, -67.18}, {Dorado, Eta2, 5.01, 92.81, 
      -65.58}, {Dorado, Nu, 5.05, 92.19, -68.83}, {Dorado, Epsilon, 5.1, 
      87.47, -66.92}, {Dorado, Lambda, 5.13, 81.58, -58.92}, 
     {Dorado, Kappa, 5.27, 71.09, -59.73}, {Dorado, Pi2, 5.38, 96.37, 
      -69.68}, {Dorado, Pi1, 5.55, 95.66, -69.98}, {Dorado, Eta1, 5.7, 91.54, 
      -66.05}, {Draco, Gamma, 2.23, 269.15, 51.48}, 
     {Draco, Eta, 2.73, 246., 61.5}, {Draco, Beta, 2.79, 262.61, 52.32}, 
     {Draco, Delta, 3.07, 288.14, 67.67}, {Draco, Zeta, 3.18, 257.2, 65.72}, 
     {Draco, Iota, 3.3, 231.23, 58.97}, {Draco, Chi, 3.56, 275.27, 72.73}, 
     {Draco, Alpha, 3.65, 211.1, 64.37}, {Draco, Xi, 3.74, 268.38, 56.87}, 
     {Draco, Epsilon, 3.83, 297.04, 70.27}, {Draco, Lambda, 3.83, 172.85, 
      69.33}, {Draco, Kappa, 3.87, 188.37, 69.78}, {Draco, Theta, 4.01, 
      240.47, 58.57}, {Draco, Phi, 4.21, 275.19, 71.33}, 
     {Draco, Tau, 4.45, 288.89, 73.35}, {Draco, Rho, 4.51, 300.7, 67.87}, 
     {Draco, 10, 4.58, 207.86, 64.72}, {Draco, Pi, 4.58, 290.17, 65.72}, 
     {Draco, Psi, 4.59, 265.48, 72.15}, {Draco, Omicron, 4.65, 282.8, 59.38}, 
     {Draco, Sigma, 4.69, 293.09, 69.65}, {Draco, 45, 4.77, 278.14, 57.05}, 
     {Draco, Omega, 4.8, 264.24, 68.75}, {Draco, Upsilon, 4.81, 283.6, 71.3}, 
     {Draco, 42, 4.82, 276.5, 65.57}, {Draco, 18, 4.83, 250.23, 64.6}, 
     {Draco, Nu1, 4.88, 263.04, 55.18}, {Draco, Nu2, 4.88, 263.07, 55.17}, 
     {Draco, 19, 4.89, 254.01, 65.13}, {Draco, 6, 4.94, 188.68, 70.02}, 
     {Draco, 15, 4.97, 247., 68.77}, {Draco, 54, 4.98, 288.48, 57.7}, 
     {Draco, 39, 4.99, 275.98, 58.8}, {Draco, 4, 5., 187.53, 69.2}, 
     {Draco, 35, 5.01, 267.36, 76.97}, {Draco, 36, 5.02, 273.47, 64.4}, 
     {Draco, 30, 5.03, 267.27, 50.78}, {Draco, 46, 5.05, 280.66, 55.53}, 
     {Draco, 27, 5.06, 262.99, 68.13}, {Draco, 17, 5.08, 249.06, 52.93}, 
     {Draco, 53, 5.12, 287.92, 56.85}, {Draco, 59, 5.15, 287.29, 76.57}, 
     {Draco, 73, 5.19, 307.88, 74.97}, {Draco, 8, 5.24, 193.87, 65.43}, 
     {Draco, 2, 5.25, 174.01, 69.33}, {Draco, 26, 5.25, 263.75, 61.87}, 
     {Draco, 64, 5.27, 300.37, 64.82}, {Draco, 3, 5.3, 175.62, 66.75}, 
     {Draco, 9, 5.32, 194.98, 66.6}, {Draco, 50, 5.35, 281.59, 75.43}, 
     {Draco, 49, 5.37, 285.18, 55.67}, {Draco, 51, 5.38, 286.23, 53.4}, 
     {Draco, 66, 5.39, 301.38, 61.98}, {Draco, 7, 5.46, 191.89, 66.78}, 
     {Draco, 34, 5.46, 268.8, 72.}, {Draco, 75, 5.46, 307.06, 81.43}, 
     {Draco, 71, 5.62, 304.9, 62.25}, {Draco, 16, 5.65, 249.05, 52.9}, 
     {Draco, 48, 5.66, 284.19, 57.82}, {Draco, 76, 5.67, 310.65, 82.53}, 
     {Draco, 41, 5.68, 270.04, 80.}, {Draco, 68, 5.75, 302.9, 62.08}, 
     {Equuleus, Alpha, 3.91, 318.96, 5.25}, {Equuleus, Delta, 4.48, 318.62, 
      10.}, {Equuleus, Gamma, 4.67, 317.59, 10.13}, 
     {Equuleus, Beta, 5.15, 320.73, 6.82}, {Equuleus, 1, 5.42, 314.77, 4.3}, 
     {Equuleus, 3, 5.61, 316.15, 5.5}, {Eridanus, Alpha, 0.49, 24.43, 
      -57.25}, {Eridanus, Beta, 2.77, 76.96, -5.08}, 
     {Eridanus, Gamma, 2.95, 59.51, -13.52}, {Eridanus, Theta1, 3.42, 44.56, 
      -40.3}, {Eridanus, Delta, 3.53, 55.81, -9.77}, 
     {Eridanus, Phi, 3.55, 34.12, -51.52}, {Eridanus, 41, 3.55, 64.47, 
      -33.8}, {Eridanus, Chi, 3.69, 28.99, -51.6}, {Eridanus, Tau4, 3.7, 
      49.88, -21.75}, {Eridanus, Epsilon, 3.73, 53.23, -9.47}, 
     {Eridanus, Upsilon2, 3.81, 68.89, -30.57}, {Eridanus, 53, 3.86, 69.55, 
      -14.3}, {Eridanus, Eta, 3.89, 44.1, -8.9}, {Eridanus, Nu, 3.92, 69.08, 
      -3.35}, {Eridanus, 43, 3.95, 66.01, -34.02}, {Eridanus, Mu, 4.02, 
      71.37, -3.25}, {Eridanus, Omicron1, 4.05, 62.97, -6.83}, 
     {Eridanus, Tau3, 4.07, 45.6, -23.62}, {Eridanus, Iota, 4.1, 40.17, 
      -39.85}, {Eridanus, Tau6, 4.22, 56.71, -23.25}, 
     {Eridanus, Kappa, 4.24, 36.75, -47.7}, {Eridanus, Tau5, 4.26, 53.45, 
      -21.63}, {Eridanus, Lambda, 4.27, 77.29, -8.75}, 
     {Eridanus, 54, 4.31, 70.11, -19.67}, {Eridanus, Omega, 4.38, 73.22, 
      -5.45}, {Eridanus, Pi, 4.42, 56.54, -12.1}, {Eridanus, Theta2, 4.42, 
      44.57, -40.3}, {Eridanus, Omicron2, 4.43, 63.82, -7.67}, 
     {Eridanus, Tau1, 4.47, 41.27, -18.58}, {Eridanus, Upsilon1, 4.5, 68.38, 
      -29.77}, {Eridanus, Tau8, 4.63, 58.42, -24.6}, 
     {Eridanus, Tau9, 4.64, 59.98, -24.02}, {Eridanus, 17, 4.73, 52.65, 
      -5.07}, {Eridanus, Tau2, 4.76, 42.76, -21.}, {Eridanus, 64, 4.78, 
      74.98, -12.53}, {Eridanus, Psi, 4.8, 75.36, -7.17}, 
     {Eridanus, Zeta, 4.8, 48.96, -8.82}, {Eridanus, 39, 4.86, 63.6, -10.25}, 
     {Eridanus, 15, 4.87, 49.59, -22.52}, {Eridanus, 45, 4.91, 67.97, -0.05}, 
     {Eridanus, 32, 5., 58.57, -2.95}, {Eridanus, 60, 5.03, 72.55, -16.22}, 
     {Eridanus, P, 5.07, 24.95, -56.2}, {Eridanus, 47, 5.1, 68.55, -8.22}, 
     {Eridanus, 66, 5.1, 76.69, -4.65}, {Eridanus, 68, 5.12, 77.18, -4.45}, 
     {Eridanus, Xi, 5.17, 65.92, -3.75}, {Eridanus, 51, 5.21, 69.4, -2.47}, 
     {Eridanus, 20, 5.22, 54.07, -17.47}, {Eridanus, Tau7, 5.23, 56.92, 
      -23.87}, {Eridanus, 24, 5.24, 56.13, -1.17}, {Eridanus, Rho3, 5.26, 
      46.07, -7.62}, {Eridanus, 35, 5.27, 60.38, -1.55}, 
     {Eridanus, Rho2, 5.31, 45.68, -7.68}, {Eridanus, 4, 5.44, 44.35, 
      -23.87}, {Eridanus, 37, 5.44, 62.6, -6.92}, {Eridanus, 30, 5.47, 58.17, 
      -5.37}, {Eridanus, 58, 5.5, 71.9, -16.93}, {Eridanus, 62, 5.5, 74.1, 
      -5.18}, {Eridanus, 22, 5.52, 55.16, -5.22}, {Eridanus, 25, 5.54, 56.24, 
      -0.3}, {Eridanus, 5, 5.55, 44.92, -2.47}, {Eridanus, 63, 5.69, 74.96, 
      -10.27}, {Eridanus, 46, 5.71, 68.47, -6.73}, {Eridanus, Rho1, 5.75, 
      45.29, -7.65}, {Eridanus, 59, 5.76, 72.14, -16.32}, 
     {Fornax, Alpha, 3.85, 48.02, -28.98}, {Fornax, Beta, 4.45, 42.27, 
      -32.42}, {Fornax, Nu, 4.69, 31.12, -29.3}, {Fornax, Omega, 4.9, 38.46, 
      -28.23}, {Fornax, Delta, 4.99, 55.56, -31.93}, 
     {Fornax, Phi, 5.13, 37.01, -33.82}, {Fornax, Kappa, 5.19, 35.64, 
      -23.82}, {Fornax, Mu, 5.27, 33.23, -30.73}, {Fornax, Pi, 5.34, 30.31, 
      -30.}, {Fornax, Gamma2, 5.38, 42.48, -27.93}, 
     {Fornax, Eta3, 5.47, 42.67, -35.67}, {Fornax, Rho, 5.53, 56.98, -30.17}, 
     {Fornax, Chi2, 5.7, 51.89, -35.68}, {Fornax, Zeta, 5.7, 44.9, -25.27}, 
     {Fornax, Iota1, 5.74, 39.04, -30.05}, {Fornax, Lambda2, 5.78, 39.24, 
      -34.57}, {Gemini, Beta, 1.15, 116.33, 28.02}, 
     {Gemini, Gamma, 1.93, 99.43, 16.4}, {Gemini, Alpha, 1.99, 113.65, 
      31.88}, {Gemini, Mu, 2.89, 95.74, 22.52}, {Gemini, Epsilon, 2.99, 
      100.98, 25.13}, {Gemini, Eta, 3.2, 93.72, 22.5}, 
     {Gemini, Xi, 3.35, 101.33, 12.9}, {Gemini, Delta, 3.53, 110.03, 21.98}, 
     {Gemini, Kappa, 3.56, 116.11, 24.4}, {Gemini, Lambda, 3.57, 109.53, 
      16.53}, {Gemini, Theta, 3.6, 103.2, 33.97}, {Gemini, Iota, 3.78, 
      111.43, 27.8}, {Gemini, Upsilon, 4.06, 113.98, 26.9}, 
     {Gemini, Nu, 4.15, 97.24, 20.22}, {Gemini, Zeta, 4.15, 106.03, 20.57}, 
     {Gemini, 1, 4.16, 91.03, 23.27}, {Gemini, Rho, 4.17, 112.28, 31.78}, 
     {Gemini, Sigma, 4.25, 115.83, 28.88}, {Gemini, Tau, 4.39, 107.79, 
      30.25}, {Gemini, 30, 4.49, 101., 13.23}, {Gemini, 38, 4.74, 103.66, 
      13.17}, {Gemini, 81, 4.88, 116.53, 18.5}, {Gemini, Omicron, 4.89, 
      114.79, 34.58}, {Gemini, Chi, 4.94, 120.88, 27.78}, 
     {Gemini, Phi, 4.96, 118.38, 26.75}, {Gemini, 51, 5., 108.35, 16.17}, 
     {Gemini, 65, 5., 112.45, 27.92}, {Gemini, 57, 5.03, 110.87, 25.05}, 
     {Gemini, 64, 5.03, 112.34, 28.12}, {Gemini, 74, 5.05, 114.87, 17.67}, 
     {Gemini, 56, 5.1, 110.49, 20.45}, {Gemini, Pi, 5.14, 116.88, 33.42}, 
     {Gemini, 26, 5.15, 100.6, 17.65}, {Gemini, 68, 5.15, 113.4, 15.82}, 
     {Gemini, Omega, 5.17, 105.6, 24.2}, {Gemini, 36, 5.23, 102.89, 21.77}, 
     {Gemini, 63, 5.25, 111.93, 21.45}, {Gemini, 76, 5.29, 116.03, 25.78}, 
     {Gemini, 85, 5.35, 118.92, 19.88}, {Gemini, 45, 5.41, 107.09, 15.92}, 
     {Gemini, 28, 5.47, 101.19, 28.97}, {Gemini, 70, 5.49, 114.64, 35.05}, 
     {Gemini, 47, 5.58, 107.85, 26.85}, {Gemini, 59, 5.64, 111.14, 27.63}, 
     {Gemini, 41, 5.68, 105.07, 16.08}, {Gemini, 53, 5.71, 108.99, 27.9}, 
     {Gemini, 33, 5.73, 102.45, 16.2}, {Gemini, 3, 5.74, 92.43, 23.12}, 
     {Gemini, 35, 5.74, 102.61, 13.42}, {Gemini, 37, 5.74, 103.83, 25.37}, 
     {Grus, Alpha, 1.74, 332.06, -46.97}, {Grus, Beta, 2.1, 340.67, -46.88}, 
     {Grus, Gamma, 3., 328.48, -37.37}, {Grus, Epsilon, 3.48, 342.14, 
      -51.32}, {Grus, Iota, 3.89, 347.59, -45.25}, {Grus, Delta1, 3.96, 
      337.32, -43.48}, {Grus, Zeta, 4.11, 345.22, -52.75}, 
     {Grus, Delta2, 4.12, 337.44, -43.75}, {Grus, Theta, 4.27, 346.72, 
      -43.53}, {Grus, Lambda, 4.47, 331.53, -39.55}, 
     {Grus, Mu1, 4.78, 333.9, -41.35}, {Grus, Rho, 4.83, 340.88, -41.42}, 
     {Grus, Eta, 4.84, 341.41, -53.5}, {Grus, Mu2, 5.08, 334.11, -41.62}, 
     {Grus, Kappa, 5.2, 346.17, -53.97}, {Grus, Xi, 5.28, 323.02, -41.18}, 
     {Grus, Nu, 5.46, 337.17, -39.13}, {Grus, Phi, 5.51, 349.54, -40.82}, 
     {Grus, Omicron, 5.52, 351.65, -52.73}, {Grus, Upsilon, 5.6, 346.73, 
      -38.9}, {Grus, Pi, 5.61, 335.78, -45.93}, {Hercules, Beta, 2.78, 
      247.55, 21.48}, {Hercules, Zeta, 2.81, 250.32, 31.6}, 
     {Hercules, Delta, 3.14, 258.76, 24.83}, {Hercules, Pi, 3.16, 258.76, 
      36.8}, {Hercules, Mu, 3.41, 266.62, 27.73}, {Hercules, Alpha1, 3.5, 
      258.66, 14.38}, {Hercules, Eta, 3.53, 250.73, 38.93}, 
     {Hercules, Xi, 3.69, 269.44, 29.25}, {Hercules, Gamma, 3.74, 245.48, 
      19.15}, {Hercules, Iota, 3.8, 264.86, 46.02}, 
     {Hercules, Omicron, 3.83, 271.88, 28.77}, {Hercules, Theta, 3.84, 
      269.06, 37.25}, {Hercules, Tau, 3.89, 244.93, 46.32}, 
     {Hercules, Epsilon, 3.91, 255.07, 30.92}, {Hercules, Sigma, 4.2, 248.53, 
      42.45}, {Hercules, Phi, 4.25, 242.19, 44.93}, 
     {Hercules, Nu, 4.39, 269.63, 30.2}, {Hercules, Lambda, 4.4, 262.68, 
      26.1}, {Hercules, Rho, 4.52, 260.92, 37.13}, {Hercules, Omega, 4.59, 
      246.35, 14.03}, {Hercules, Chi, 4.61, 238.17, 42.45}, 
     {Hercules, 69, 4.62, 259.42, 37.3}, {Hercules, 93, 4.66, 270.01, 16.75}, 
     {Hercules, Upsilon, 4.74, 240.7, 46.03}, {Hercules, 52, 4.83, 252.31, 
      45.98}, {Hercules, U, 4.83, 259.33, 33.1}, {Hercules, 29, 4.84, 248.15, 
      11.48}, {Hercules, 42, 4.9, 249.69, 48.92}, {Hercules, 60, 4.9, 256.34, 
      12.75}, {Hercules, G, 4.9, 247.16, 41.88}, {Hercules, 95, 4.96, 270.38, 
      21.6}, {Hercules, Kappa, 5., 242.02, 17.05}, {Hercules, 51, 5.04, 
      252.94, 24.65}, {Hercules, 98, 5.06, 271.51, 22.23}, 
     {Hercules, 99, 5.1, 271.76, 30.57}, {Hercules, 87, 5.11, 267.2, 25.62}, 
     {Hercules, 5, 5.12, 240.31, 17.82}, {Hercules, 43, 5.14, 251.46, 8.58}, 
     {Hercules, 70, 5.14, 260.23, 24.5}, {Hercules, 90, 5.15, 268.32, 40.02}, 
     {Hercules, 95, 5.18, 270.37, 21.6}, {Hercules, 45, 5.23, 251.94, 5.25}, 
     {Hercules, 59, 5.25, 255.4, 33.57}, {Hercules, 96, 5.27, 270.6, 20.83}, 
     {Hercules, 53, 5.28, 253.24, 31.7}, {Hercules, 2, 5.35, 238.66, 43.15}, 
     {Hercules, 54, 5.36, 253.84, 18.43}, {Hercules, 82, 5.36, 264.16, 48.6}, 
     {Hercules, Alpha2, 5.39, 258.67, 14.38}, {Hercules, 72, 5.4, 260.16, 
      32.47}, {Hercules, 89, 5.44, 268.85, 26.05}, 
     {Hercules, 9, 5.47, 243.32, 5.03}, {Hercules, 25, 5.48, 246.35, 37.38}, 
     {Hercules, 47, 5.5, 252.58, 7.25}, {Hercules, 83, 5.54, 265.62, 24.57}, 
     {Hercules, 84, 5.54, 265.84, 24.32}, {Hercules, 78, 5.56, 262.96, 
      28.42}, {Hercules, 79, 5.57, 264.38, 24.3}, {Hercules, 74, 5.59, 
      260.09, 46.23}, {Hercules, 28, 5.62, 248.15, 5.52}, 
     {Hercules, 50, 5.66, 252.66, 29.82}, {Hercules, 73, 5.67, 261.02, 
      22.95}, {Hercules, 16, 5.71, 243.87, 18.82}, {Hercules, 37, 5.73, 
      250.16, 4.22}, {Hercules, 4, 5.75, 238.88, 42.57}, 
     {Hercules, 77, 5.76, 261.68, 48.27}, {Horologium, Alpha, 3.85, 63.5, 
      -42.28}, {Horologium, R, 4., 43.47, -49.9}, {Horologium, Delta, 4.92, 
      62.71, -41.98}, {Horologium, Beta, 4.98, 44.7, -64.07}, 
     {Horologium, Mu, 5.1, 45.9, -59.75}, {Horologium, Zeta, 5.2, 40.17, 
      -54.55}, {Horologium, Nu, 5.25, 42.25, -62.8}, 
     {Horologium, Eta, 5.3, 39.35, -52.55}, {Horologium, Lambda, 5.34, 36.23, 
      -60.32}, {Horologium, Iota, 5.4, 40.64, -50.8}, 
     {Hydra, Alpha, 1.98, 141.9, -8.67}, {Hydra, Gamma, 2.98, 199.73, 
      -23.18}, {Hydra, Nu, 3.11, 162.4, -16.18}, {Hydra, Zeta, 3.11, 133.85, 
      5.95}, {Hydra, Pi, 3.26, 211.6, -26.68}, {Hydra, Epsilon, 3.37, 131.7, 
      6.42}, {Hydra, Xi, 3.54, 173.25, -31.85}, {Hydra, Lambda, 3.61, 152.65, 
      -12.37}, {Hydra, Mu, 3.81, 156.52, -16.85}, {Hydra, Theta, 3.88, 
      138.59, 2.32}, {Hydra, Iota, 3.88, 144.96, -1.13}, 
     {Hydra, Upsilon1, 4.1, 147.87, -14.85}, {Hydra, Delta, 4.14, 129.42, 
      5.7}, {Hydra, Beta, 4.28, 178.23, -33.9}, {Hydra, Eta, 4.29, 130.81, 
      3.38}, {Hydra, 12, 4.31, 131.59, -13.55}, {Hydra, Rho, 4.35, 132.11, 
      5.83}, {Hydra, 58, 4.41, 222.57, -27.97}, {Hydra, Sigma, 4.43, 129.69, 
      3.35}, {Hydra, Tau2, 4.56, 143., -1.18}, {Hydra, Tau1, 4.59, 142.28, 
      -2.77}, {Hydra, Upsilon2, 4.59, 151.28, -13.07}, 
     {Hydra, 51, 4.76, 215.78, -27.77}, {Hydra, 26, 4.78, 139.94, -11.97}, 
     {Hydra, U, 4.8, 159.39, -13.38}, {Hydra, 27, 4.81, 140.12, -9.55}, 
     {Hydra, 9, 4.85, 130.43, -15.95}, {Hydra, Phi, 4.9, 159.65, -16.87}, 
     {Hydra, Chi1, 4.94, 166.33, -27.28}, {Hydra, 52, 4.96, 217.05, -29.5}, 
     {Hydra, 6, 4.97, 130., -12.47}, {Hydra, Omega, 4.97, 136.5, 5.1}, 
     {Hydra, Psi, 4.97, 197.26, -23.12}, {Hydra, Kappa, 5.06, 145.08, 
      -14.33}, {Hydra, 44, 5.07, 158.5, -23.75}, {Hydra, 50, 5.13, 213.19, 
      -27.25}, {Hydra, 47, 5.15, 209.63, -24.97}, {Hydra, 54, 5.21, 221.5, 
      -25.43}, {Hydra, 23, 5.23, 139.17, -6.35}, {Hydra, 56, 5.28, 221.93, 
      -26.08}, {Hydra, 14, 5.3, 132.34, -3.43}, {Hydra, 20, 5.45, 137.4, 
      -8.78}, {Hydra, 24, 5.46, 139.17, -8.75}, {Hydra, 15, 5.53, 132.9, 
      -7.17}, {Hydra, 33, 5.55, 143.63, -5.92}, {Hydra, 2, 5.58, 126.61, 
      -4.}, {Hydra, 28, 5.58, 141.35, -5.12}, {Hydra, 19, 5.59, 137.18, 
      -8.58}, {Hydra, 1, 5.6, 126.15, -3.75}, {Hydra, 55, 5.67, 221.84, 
      -25.62}, {Hydra, 59, 5.68, 224.66, -27.65}, {Hydra, Chi2, 5.7, 166.49, 
      -27.28}, {Hydra, 3, 5.71, 128.87, -7.98}, {Hydrus, Beta, 2.8, 6.44, 
      -77.25}, {Hydrus, Alpha, 2.86, 29.69, -61.57}, 
     {Hydrus, Gamma, 3.27, 56.81, -74.25}, {Hydrus, Delta, 4.08, 35.44, 
      -68.67}, {Hydrus, Epsilon, 4.1, 39.9, -68.27}, 
     {Hydrus, Eta2, 4.68, 28.73, -67.63}, {Hydrus, Nu, 4.74, 42.62, -75.07}, 
     {Hydrus, Zeta, 4.83, 41.39, -67.62}, {Hydrus, Kappa, 5., 35.72, -73.65}, 
     {Hydrus, Lambda, 5.06, 12.15, -74.92}, {Hydrus, Mu, 5.27, 37.92, 
      -79.12}, {Hydrus, Theta, 5.5, 45.57, -71.92}, 
     {Hydrus, Iota, 5.51, 48.99, -77.38}, {Hydrus, Pi1, 5.54, 33.56, -67.83}, 
     {Hydrus, Pi2, 5.68, 33.87, -67.75}, {Indus, Alpha, 3.11, 309.39, 
      -47.28}, {Indus, Beta, 3.64, 313.7, -58.45}, {Indus, Theta, 4.38, 
      319.96, -53.45}, {Indus, Delta, 4.39, 329.48, -54.98}, 
     {Indus, Eta, 4.5, 311.01, -51.93}, {Indus, Epsilon, 4.67, 330.84, 
      -56.78}, {Indus, Zeta, 4.88, 312.37, -46.23}, 
     {Indus, Mu, 5.1, 316.31, -54.72}, {Indus, Iota, 5.2, 312.88, -51.62}, 
     {Indus, Nu, 5.28, 336.15, -72.25}, {Indus, Omicron, 5.5, 327.7, -69.63}, 
     {Lacerta, Alpha, 3.75, 337.82, 50.28}, {Lacerta, 1, 4.13, 334., 37.75}, 
     {Lacerta, 5, 4.34, 337.38, 47.72}, {Lacerta, Beta, 4.42, 335.89, 52.23}, 
     {Lacerta, 11, 4.48, 340.13, 44.27}, {Lacerta, 6, 4.49, 337.62, 43.13}, 
     {Lacerta, 4, 4.56, 336.13, 49.47}, {Lacerta, 2, 4.57, 335.26, 46.53}, 
     {Lacerta, 9, 4.63, 339.34, 51.55}, {Lacerta, 10, 4.87, 339.81, 39.05}, 
     {Lacerta, 15, 4.94, 343.01, 43.32}, {Lacerta, 13, 5.08, 341.03, 41.82}, 
     {Lacerta, 12, 5.22, 340.37, 40.22}, {Lacerta, 16, 5.6, 344.1, 41.6}, 
     {Leo, Alpha, 1.35, 152.09, 11.97}, {Leo, Gamma1, 1.9, 155., 19.85}, 
     {Leo, Beta, 2.13, 177.27, 14.57}, {Leo, Delta, 2.56, 168.53, 20.52}, 
     {Leo, Epsilon, 2.97, 146.46, 23.77}, {Leo, Theta, 3.34, 168.56, 15.43}, 
     {Leo, Zeta, 3.43, 154.17, 23.42}, {Leo, Omicron, 3.48, 145.29, 9.9}, 
     {Leo, Eta, 3.53, 151.83, 16.77}, {Leo, Rho, 3.85, 158.2, 9.3}, 
     {Leo, Mu, 3.89, 148.19, 26.02}, {Leo, Iota, 3.95, 170.98, 10.53}, 
     {Leo, Sigma, 4.03, 170.28, 6.03}, {Leo, Upsilon, 4.3, 174.24, -0.82}, 
     {Leo, Lambda, 4.31, 142.93, 22.98}, {Leo, 31, 4.37, 151.98, 10.}, 
     {Leo, R, 4.4, 146.89, 11.43}, {Leo, 60, 4.41, 165.58, 20.18}, 
     {Leo, Kappa, 4.46, 141.16, 26.18}, {Leo, Phi, 4.46, 169.17, -3.65}, 
     {Leo, 54, 4.5, 163.9, 24.75}, {Leo, 93, 4.54, 177., 20.22}, 
     {Leo, 72, 4.63, 168.8, 23.08}, {Leo, Chi, 4.63, 166.25, 7.35}, 
     {Leo, Pi, 4.7, 150.05, 8.03}, {Leo, 61, 4.74, 165.46, -2.48}, 
     {Leo, 87, 4.76, 172.58, -3.}, {Leo, 40, 4.8, 154.93, 19.48}, 
     {Leo, 58, 4.84, 165.14, 3.62}, {Leo, Tau, 4.95, 171.99, 2.85}, 
     {Leo, Xi, 4.96, 142.98, 11.3}, {Leo, 59, 4.99, 165.19, 6.1}, 
     {Leo, 10, 5.01, 144.3, 6.83}, {Leo, 6, 5.07, 142.99, 9.72}, 
     {Leo, 48, 5.07, 158.7, 6.95}, {Leo, 75, 5.17, 169.33, 2.02}, 
     {Leo, Nu, 5.2, 149.56, 12.43}, {Leo, 53, 5.25, 162.31, 10.53}, 
     {Leo, 92, 5.26, 175.2, 21.35}, {Leo, 73, 5.32, 168.97, 13.3}, 
     {Leo, 22, 5.33, 147.98, 24.4}, {Leo, 79, 5.38, 171.01, 1.4}, 
     {Leo, Omega, 5.4, 142.11, 9.07}, {Leo, 69, 5.41, 168.44, -0.08}, 
     {Leo, Psi, 5.41, 145.93, 14.03}, {Leo, 51, 5.45, 161.6, 18.88}, 
     {Leo, 52, 5.47, 161.61, 14.18}, {Leo, 95, 5.5, 178.92, 15.65}, 
     {Leo, 37, 5.51, 154.17, 13.73}, {Leo, 65, 5.52, 166.73, 1.95}, 
     {Leo, 46, 5.54, 158.05, 14.13}, {Leo, 86, 5.58, 172.62, 18.42}, 
     {Leo, 18, 5.6, 146.6, 11.8}, {Leo, 44, 5.61, 156.31, 8.78}, 
     {Leo, 81, 5.61, 171.4, 16.45}, {Leo, 15, 5.62, 145.89, 29.97}, 
     {Leo, TX, 5.63, 158.76, 8.65}, {Leo, 67, 5.64, 167.2, 24.67}, 
     {Leo, 8, 5.72, 144.26, 16.43}, {Leo, 89, 5.76, 173.59, 3.07}, 
     {Leo, 3, 5.78, 142.12, 8.18}, {Lepus, Alpha, 2.58, 83.18, -17.83}, 
     {Lepus, Beta, 2.84, 82.06, -20.75}, {Lepus, Epsilon, 3.19, 76.37, 
      -22.37}, {Lepus, Mu, 3.32, 78.23, -16.2}, {Lepus, Zeta, 3.54, 86.74, 
      -14.83}, {Lepus, Gamma, 3.6, 86.12, -22.45}, {Lepus, Eta, 3.71, 89.1, 
      -14.17}, {Lepus, Delta, 3.78, 87.83, -20.87}, 
     {Lepus, Lambda, 4.29, 79.89, -13.18}, {Lepus, Kappa, 4.36, 78.31, 
      -12.95}, {Lepus, Iota, 4.45, 78.08, -11.87}, {Lepus, Theta, 4.67, 
      91.54, -14.95}, {Lepus, 17, 4.92, 91.25, -16.48}, 
     {Lepus, 8, 5.24, 80.88, -13.92}, {Lepus, Nu, 5.29, 80., -12.32}, 
     {Lepus, 19, 5.31, 91.92, -19.17}, {Lepus, 10, 5.54, 82.78, -20.87}, 
     {Lepus, 1, 5.75, 75.69, -22.78}, {Libra, Beta, 2.61, 229.25, -9.38}, 
     {Libra, Alpha2, 2.75, 222.72, -16.05}, {Libra, Sigma, 3.32, 226.02, 
      -25.28}, {Libra, Upsilon, 3.58, 234.25, -28.13}, 
     {Libra, Tau, 3.65, 234.67, -29.78}, {Libra, Gamma, 3.9, 233.88, -14.78}, 
     {Libra, Theta, 4.14, 238.46, -16.73}, {Libra, 16, 4.48, 224.3, -4.33}, 
     {Libra, Iota, 4.53, 228.05, -19.8}, {Libra, 37, 4.61, 233.55, -10.07}, 
     {Libra, Kappa, 4.72, 235.49, -19.67}, {Libra, 48, 4.86, 239.55, -14.27}, 
     {Libra, Delta, 4.92, 225.25, -8.52}, {Libra, Epsilon, 4.93, 231.05, 
      -10.33}, {Libra, 11, 4.94, 222.75, -2.3}, {Libra, 42, 4.95, 235.07, 
      -23.83}, {Libra, Lambda, 5.01, 238.33, -20.17}, 
     {Libra, 36, 5.15, 233.65, -28.05}, {Libra, Alpha1, 5.15, 222.67, -16.}, 
     {Libra, 32, 5.16, 232.06, -16.72}, {Libra, Nu, 5.2, 226.66, -16.25}, 
     {Libra, 12, 5.3, 223.59, -24.65}, {Libra, 41, 5.38, 234.73, -19.3}, 
     {Libra, Mu, 5.38, 222.33, -14.15}, {Libra, Eta, 5.4, 236.02, -15.67}, 
     {Libra, 49, 5.46, 240.08, -16.53}, {Libra, Xi2, 5.46, 224.19, -11.4}, 
     {Libra, Zeta, 5.5, 233.23, -16.85}, {Libra, 50, 5.54, 240.2, -8.42}, 
     {Libra, 4, 5.75, 220.81, -25.}, {LeoMinor, 46, 3.81, 163.32, 34.22}, 
     {LeoMinor, Beta, 4.2, 156.97, 36.7}, {LeoMinor, 21, 4.48, 151.86, 
      35.25}, {LeoMinor, 10, 4.55, 143.55, 36.38}, {LeoMinor, 37, 4.67, 
      159.68, 31.98}, {LeoMinor, 30, 4.73, 156.48, 33.78}, 
     {LeoMinor, 41, 5.04, 160.85, 23.2}, {LeoMinor, 19, 5.12, 149.42, 41.05}, 
     {LeoMinor, 23, 5.35, 154.06, 29.32}, {LeoMinor, 42, 5.35, 161.47, 
      30.68}, {LeoMinor, 20, 5.36, 150.25, 31.92}, 
     {LeoMinor, 8, 5.37, 142.88, 35.1}, {LeoMinor, 11, 5.42, 143.92, 35.82}, 
     {LeoMinor, 40, 5.43, 160.76, 26.32}, {LeoMinor, 34, 5.53, 158.38, 
      34.98}, {LeoMinor, 28, 5.56, 156.04, 33.72}, {LeoMinor, 27, 5.69, 
      155.78, 33.92}, {Lupus, Alpha, 2.31, 220.48, -47.4}, 
     {Lupus, Beta, 2.67, 224.63, -43.13}, {Lupus, Gamma, 2.77, 233.79, 
      -41.17}, {Lupus, Delta, 3.21, 230.34, -40.65}, 
     {Lupus, Epsilon, 3.36, 230.67, -44.7}, {Lupus, Eta, 3.4, 240.03, -38.4}, 
     {Lupus, Zeta, 3.4, 228.07, -52.1}, {Lupus, 1, 3.55, 230.45, -36.27}, 
     {Lupus, Iota, 3.55, 214.85, -46.07}, {Lupus, Kappa, 3.86, 227.98, 
      -48.73}, {Lupus, Chi, 3.94, 237.74, -33.62}, {Lupus, Rho, 4.04, 219.47, 
      -49.42}, {Lupus, Lambda, 4.05, 227.21, -45.28}, 
     {Lupus, Theta, 4.21, 241.65, -36.8}, {Lupus, Mu, 4.26, 229.63, -47.87}, 
     {Lupus, 2, 4.33, 229.46, -30.15}, {Lupus, Omega, 4.33, 234.51, -42.57}, 
     {Lupus, Omicron, 4.33, 222.91, -43.58}, {Lupus, Tau2, 4.35, 216.55, 
      -45.38}, {Lupus, Sigma, 4.41, 218.15, -50.47}, 
     {Lupus, 2, 4.53, 230.79, -36.87}, {Lupus, Tau1, 4.55, 216.53, -45.22}, 
     {Lupus, Psi1, 4.66, 234.94, -34.42}, {Lupus, Pi, 4.72, 226.28, -47.05}, 
     {Lupus, Psi2, 4.74, 235.67, -34.7}, {Lupus, 1, 4.9, 228.66, -31.52}, 
     {Lupus, Nu1, 4.99, 230.53, -47.93}, {Lupus, Xi1, 5.37, 239.23, -33.97}, 
     {Lupus, Upsilon, 5.38, 231.19, -39.7}, {Lupus, Nu2, 5.63, 230.45, 
      -48.32}, {Lynx, Alpha, 3.14, 140.26, 34.4}, {Lynx, 38, 3.81, 139.71, 
      36.82}, {Lynx, 31, 4.25, 125.71, 43.2}, {Lynx, 15, 4.35, 104.32, 
      58.42}, {Lynx, 2, 4.45, 94.9, 59.02}, {Lynx, 21, 4.55, 111.68, 49.22}, 
     {Lynx, 27, 4.8, 122.11, 51.52}, {Lynx, 12, 4.87, 101.56, 59.45}, 
     {Lynx, 16, 4.89, 104.4, 45.08}, {Lynx, 1, 4.9, 94.48, 61.52}, 
     {Lynx, 24, 4.98, 115.75, 58.72}, {Lynx, 35, 5.15, 132.99, 43.73}, 
     {Lynx, 18, 5.2, 108.98, 59.63}, {Lynx, 5, 5.21, 96.7, 58.42}, 
     {Lynx, 42, 5.25, 144.59, 40.23}, {Lynx, 36, 5.32, 138.45, 43.22}, 
     {Lynx, 13, 5.34, 101.7, 57.17}, {Lynx, 22, 5.36, 112.49, 49.68}, 
     {Lynx, 34, 5.37, 130.26, 45.83}, {Lynx, 14, 5.38, 103.27, 59.45}, 
     {Lynx, 29, 5.52, 124.46, 59.58}, {Lynx, 26, 5.55, 118.68, 47.55}, 
     {Lynx, 19, 5.61, 110.72, 55.28}, {Lynx, 43, 5.61, 145.5, 39.77}, 
     {Lynx, RR, 5.64, 96.61, 56.28}, {Lynx, 33, 5.71, 128.68, 36.42}, 
     {Lynx, 11, 5.77, 99.41, 56.85}, {Lyra, Alpha, 0.04, 279.23, 38.78}, 
     {Lyra, Gamma, 3.25, 284.73, 32.68}, {Lyra, Beta, 3.43, 282.52, 33.37}, 
     {Lyra, R, 3.9, 283.84, 43.95}, {Lyra, Delta2, 4.3, 283.62, 36.9}, 
     {Lyra, Kappa, 4.32, 274.96, 36.07}, {Lyra, Theta, 4.35, 289.09, 38.13}, 
     {Lyra, Zeta1, 4.35, 281.2, 37.6}, {Lyra, Eta, 4.38, 288.44, 39.13}, 
     {Lyra, Lambda, 4.93, 285., 32.13}, {Lyra, 16, 5.03, 285.36, 46.95}, 
     {Lyra, Epsilon1, 5.06, 281.09, 39.67}, {Lyra, Mu, 5.11, 276.06, 39.5}, 
     {Lyra, Epsilon2, 5.14, 281.1, 39.6}, {Lyra, 17, 5.21, 286.86, 32.5}, 
     {Lyra, Nu, 5.24, 282.47, 32.55}, {Lyra, Iota, 5.26, 286.82, 36.1}, 
     {Lyra, Delta1, 5.51, 283.43, 36.98}, {Lyra, Zeta2, 5.73, 281.2, 37.58}, 
     {Mensa, Alpha, 5.08, 92.56, -74.75}, {Mensa, Gamma, 5.18, 82.97, 
      -76.35}, {Mensa, Beta, 5.3, 75.68, -71.32}, {Mensa, Theta, 5.44, 
      104.14, -79.43}, {Mensa, Eta, 5.46, 73.8, -74.93}, 
     {Mensa, Kappa, 5.46, 87.57, -79.37}, {Mensa, Epsilon, 5.52, 111.41, 
      -79.1}, {Mensa, Mu, 5.53, 70.77, -70.93}, {Mensa, Zeta, 5.63, 100.01, 
      -80.8}, {Mensa, Pi, 5.64, 84.29, -80.47}, {Mensa, Delta, 5.68, 64.5, 
      -80.22}, {Microscopium, Gamma, 4.66, 315.32, -32.27}, 
     {Microscopium, Epsilon, 4.7, 319.49, -32.17}, {Microscopium, Theta1, 
      4.81, 320.19, -40.82}, {Microscopium, Alpha, 4.88, 312.49, -33.78}, 
     {Microscopium, Iota, 5.09, 312.12, -43.98}, {Microscopium, Nu, 5.3, 
      308.48, -44.52}, {Microscopium, Zeta, 5.35, 315.74, -38.63}, 
     {Microscopium, Eta, 5.56, 316.6, -41.38}, {Microscopium, Delta, 5.68, 
      316.5, -30.12}, {Microscopium, Theta2, 5.75, 321.1, -41.}, 
     {Monoceros, Alpha, 3.93, 115.31, -9.55}, {Monoceros, Gamma, 3.97, 93.72, 
      -6.28}, {Monoceros, Delta, 4.14, 107.96, -0.5}, 
     {Monoceros, 7, 4.25, 94.93, -7.83}, {Monoceros, Zeta, 4.34, 122.15, 
      -2.98}, {Monoceros, 8, 4.44, 95.94, 4.6}, {Monoceros, 18, 4.46, 101.97, 
      2.4}, {Monoceros, 13, 4.48, 98.22, 7.33}, {Monoceros, Beta, 4.6, 97.2, 
      -7.03}, {Monoceros, 15, 4.65, 100.24, 9.88}, {Monoceros, 28, 4.68, 
      120.3, -1.4}, {Monoceros, 17, 4.75, 101.83, 8.05}, 
     {Monoceros, 20, 4.91, 107.56, -4.23}, {Monoceros, 27, 4.93, 119.93, 
      -3.67}, {Monoceros, 3, 4.95, 90.46, -10.6}, {Monoceros, 19, 4.98, 
      105.73, -4.25}, {Monoceros, 2, 5.03, 89.77, -9.57}, 
     {Monoceros, 10, 5.05, 96.99, -4.77}, {Monoceros, 25, 5.13, 114.32, 
      -4.1}, {Monoceros, 21, 5.44, 107.85, -0.3}, {Monoceros, T, 5.6, 96.3, 
      7.08}, {Musca, Alpha, 2.7, 189.3, -69.13}, {Musca, Beta, 3.05, 191.57, 
      -68.12}, {Musca, Delta, 3.61, 195.57, -71.55}, 
     {Musca, Lambda, 3.63, 176.4, -66.72}, {Musca, Gamma, 3.88, 188.12, 
      -72.13}, {Musca, Epsilon, 4.13, 184.39, -67.95}, 
     {Musca, Mu, 4.73, 177.06, -66.82}, {Musca, Eta, 4.79, 198.81, -67.9}, 
     {Musca, Iota1, 5.04, 201.28, -74.9}, {Musca, Zeta2, 5.14, 185.53, 
      -67.52}, {Musca, Theta, 5.55, 197.03, -65.3}, 
     {Musca, Zeta1, 5.73, 185.55, -68.3}, {Norma, Gamma2, 4.04, 244.96, 
      -50.17}, {Norma, Epsilon, 4.46, 246.8, -47.57}, 
     {Norma, Eta, 4.64, 240.8, -49.23}, {Norma, Iota, 4.65, 240.88, -57.78}, 
     {Norma, Delta, 4.72, 241.62, -45.17}, {Norma, Mu, 4.9, 248.52, -44.05}, 
     {Norma, Gamma1, 4.98, 244.25, -50.07}, {Norma, Kappa, 5., 243.37, 
      -54.63}, {Norma, Theta, 5.36, 243.82, -47.37}, 
     {Norma, Lambda, 5.44, 244.82, -42.68}, {Norma, Iota2, 5.57, 242.32, 
      -57.93}, {Octans, Nu, 3.78, 325.37, -77.38}, {Octans, Beta, 4.14, 
      341.51, -81.38}, {Octans, Delta, 4.31, 216.73, -83.67}, 
     {Octans, Theta, 4.77, 0.4, -77.07}, {Octans, Epsilon, 5.09, 335., 
      -80.43}, {Octans, Gamma1, 5.11, 358.03, -82.02}, 
     {Octans, Alpha, 5.14, 316.18, -77.02}, {Octans, Chi, 5.27, 283.7, 
      -87.6}, {Octans, Gamma3, 5.27, 2.51, -82.23}, 
     {Octans, Lambda, 5.28, 327.73, -82.72}, {Octans, Xi, 5.34, 342.6, 
      -80.12}, {Octans, Zeta, 5.41, 134.17, -85.67}, 
     {Octans, Iota, 5.45, 193.75, -85.13}, {Octans, Sigma, 5.45, 317.06, 
      -88.95}, {Octans, Phi, 5.46, 275.9, -75.03}, 
     {Octans, Tau, 5.48, 352.01, -87.48}, {Octans, Psi, 5.5, 334.46, -77.52}, 
     {Octans, Rho, 5.56, 235.82, -84.47}, {Octans, Kappa, 5.57, 205.23, 
      -85.78}, {Octans, Pi1, 5.64, 225.45, -83.22}, 
     {Octans, Pi2, 5.64, 226.2, -83.03}, {Octans, Gamma2, 5.72, 359.39, 
      -82.18}, {Octans, Upsilon, 5.76, 337.91, -85.97}, 
     {Ophiuchus, Alpha, 2.07, 263.73, 12.57}, {Ophiuchus, Eta, 2.43, 257.6, 
      -15.72}, {Ophiuchus, Zeta, 2.57, 249.29, -10.57}, 
     {Ophiuchus, Delta, 2.73, 243.58, -3.68}, {Ophiuchus, Beta, 2.77, 265.87, 
      4.57}, {Ophiuchus, Kappa, 3.2, 254.43, 9.38}, 
     {Ophiuchus, Epsilon, 3.23, 244.58, -4.7}, {Ophiuchus, Theta, 3.28, 
      260.5, -25.}, {Ophiuchus, Nu, 3.34, 269.75, -9.78}, 
     {Ophiuchus, 72, 3.73, 271.84, 9.57}, {Ophiuchus, Gamma, 3.74, 266.97, 
      2.72}, {Ophiuchus, Lambda, 3.81, 247.73, 1.98}, 
     {Ophiuchus, 67, 3.96, 270.16, 2.93}, {Ophiuchus, 44, 4.17, 261.59, 
      -24.18}, {Ophiuchus, 70, 4.2, 271.36, 2.5}, {Ophiuchus, Phi, 4.28, 
      247.78, -16.62}, {Ophiuchus, 45, 4.29, 261.84, -29.87}, 
     {Ophiuchus, Chi, 4.32, 246.76, -18.47}, {Ophiuchus, Sigma, 4.34, 261.63, 
      4.15}, {Ophiuchus, Iota, 4.37, 253.5, 10.17}, 
     {Ophiuchus, Xi, 4.4, 260.25, -21.1}, {Ophiuchus, 68, 4.44, 270.44, 1.3}, 
     {Ophiuchus, Omega, 4.46, 248.03, -21.47}, {Ophiuchus, Psi, 4.49, 246.02, 
      -20.03}, {Ophiuchus, Mu, 4.62, 264.46, -8.12}, 
     {Ophiuchus, Upsilon, 4.63, 246.95, -8.37}, {Ophiuchus, 71, 4.64, 271.82, 
      8.73}, {Ophiuchus, 20, 4.65, 252.46, -10.78}, 
     {Ophiuchus, 66, 4.67, 270.07, 4.37}, {Ophiuchus, 41, 4.73, 259.15, 
      -0.45}, {Ophiuchus, 51, 4.8, 262.85, -23.97}, 
     {Ophiuchus, 30, 4.81, 255.26, -4.22}, {Ophiuchus, 74, 4.85, 275.21, 
      3.38}, {Ophiuchus, 58, 4.87, 265.86, -21.68}, 
     {Ophiuchus, Rho, 5.02, 246.4, -23.45}, {Ophiuchus, Omicron, 5.2, 259.5, 
      -24.3}, {Ophiuchus, 23, 5.24, 253.65, -6.15}, 
     {Ophiuchus, 36, 5.29, 258.84, -26.6}, {Ophiuchus, 37, 5.33, 258.12, 
      10.58}, {Ophiuchus, Tau, 5.34, 270.77, -8.18}, 
     {Ophiuchus, 43, 5.35, 260.84, -28.15}, {Ophiuchus, 21, 5.5, 252.85, 
      1.22}, {Ophiuchus, 24, 5.6, 254.2, -23.15}, {Ophiuchus, U, 5.7, 259.13, 
      1.2}, {Ophiuchus, 14, 5.72, 250.43, 1.18}, {Ophiuchus, 73, 5.72, 
      272.39, 4.}, {Ophiuchus, 12, 5.75, 249.09, -2.33}, 
     {Ophiuchus, 26, 5.78, 255.04, -24.98}, {Orion, Beta, 0.15, 78.63, -8.2}, 
     {Orion, Alpha, 0.8, 88.79, 7.4}, {Orion, Gamma, 1.63, 81.28, 6.35}, 
     {Orion, Epsilon, 1.69, 84.05, -1.2}, {Orion, Zeta, 2.05, 85.19, -1.95}, 
     {Orion, Kappa, 2.06, 86.94, -9.67}, {Orion, Delta, 2.2, 83., -0.3}, 
     {Orion, Iota, 2.76, 83.86, -5.92}, {Orion, Pi3, 3.19, 72.46, 6.95}, 
     {Orion, Eta, 3.35, 81.12, -2.38}, {Orion, Tau, 3.58, 79.4, -6.85}, 
     {Orion, Lambda, 3.66, 83.78, 9.93}, {Orion, Pi4, 3.68, 72.8, 5.6}, 
     {Orion, Pi5, 3.72, 73.56, 2.45}, {Orion, Sigma, 3.73, 84.69, -2.6}, 
     {Orion, Omicron2, 4.07, 74.09, 13.5}, {Orion, 2, 4.08, 84.23, 9.28}, 
     {Orion, Mu, 4.12, 90.6, 9.65}, {Orion, 29, 4.13, 80.99, -7.8}, 
     {Orion, 32, 4.2, 82.7, 5.95}, {Orion, Pi2, 4.36, 72.65, 8.9}, 
     {Orion, Chi1, 4.4, 88.6, 20.27}, {Orion, 1, 4.41, 83.7, 9.48}, 
     {Orion, Nu, 4.41, 91.9, 14.77}, {Orion, Pi6, 4.46, 74.64, 1.72}, 
     {Orion, Rho, 4.46, 78.33, 2.87}, {Orion, Xi, 4.47, 92.98, 14.22}, 
     {Orion, Omega, 4.51, 84.8, 4.12}, {Orion, 42, 4.59, 83.85, -4.83}, 
     {Orion, Psi, 4.59, 81.71, 3.1}, {Orion, Chi2, 4.62, 90.98, 20.13}, 
     {Orion, Upsilon, 4.62, 82.98, -7.32}, {Orion, 11, 4.67, 76.14, 15.4}, 
     {Orion, Pi1, 4.67, 73.72, 10.17}, {Orion, CI, 4.7, 82.43, -1.08}, 
     {Orion, 22, 4.72, 80.44, -0.38}, {Orion, Omicron1, 4.72, 73.13, 14.25}, 
     {Orion, 56, 4.75, 88.11, 1.85}, {Orion, 49, 4.8, 84.72, -7.22}, 
     {Orion, 15, 4.81, 77.42, 15.6}, {Orion, 51, 4.9, 85.62, 1.48}, 
     {Orion, 25, 4.94, 81.18, 1.83}, {Orion, 69, 4.94, 93.01, 16.13}, 
     {Orion, 23, 4.99, 80.71, 3.55}, {Orion, 74, 5.03, 94.11, 12.27}, 
     {Orion, 27, 5.06, 81.12, -0.88}, {Orion, Theta2, 5.08, 83.85, -5.42}, 
     {Orion, Theta1, 5.13, 83.82, -5.38}, {Orion, 64, 5.14, 90.86, 19.7}, 
     {Orion, 6, 5.19, 73.7, 11.43}, {Orion, 71, 5.19, 93.71, 19.15}, 
     {Orion, 60, 5.2, 89.71, 0.57}, {Orion, 45, 5.26, 83.92, -4.85}, 
     {Orion, 52, 5.26, 87., 6.45}, {Orion, 72, 5.3, 93.85, 16.13}, 
     {Orion, 5, 5.32, 73.35, 2.52}, {Orion, 73, 5.33, 93.94, 12.55}, 
     {Orion, VV, 5.33, 83.38, -1.17}, {Orion, 14, 5.34, 76.97, 8.5}, 
     {Orion, 21, 5.34, 79.8, 2.6}, {Orion, 55, 5.34, 87.84, -7.52}, 
     {Orion, 38, 5.35, 83.57, 3.77}, {Orion, 75, 5.4, 94.28, 9.95}, 
     {Orion, U, 5.4, 88.95, 20.15}, {Orion, 16, 5.43, 77.33, 9.83}, 
     {Orion, 33, 5.44, 82.81, 3.3}, {Orion, 18, 5.46, 79.02, 11.35}, 
     {Orion, 35, 5.54, 83.47, 14.3}, {Orion, 66, 5.62, 91.24, 4.17}, 
     {Orion, 63, 5.66, 91.24, 5.43}, {Orion, 68, 5.67, 93., 19.8}, 
     {Pavo, Alpha, 1.92, 306.41, -56.73}, {Pavo, Beta, 3.42, 311.24, -66.2}, 
     {Pavo, Delta, 3.57, 302.18, -66.18}, {Pavo, Eta, 3.62, 266.43, -64.73}, 
     {Pavo, Kappa, 3.9, 284.24, -67.25}, {Pavo, Epsilon, 3.96, 300.15, 
      -72.9}, {Pavo, Zeta, 4., 280.76, -71.43}, {Pavo, Lambda, 4.21, 283.05, 
      -62.18}, {Pavo, Gamma, 4.23, 321.61, -65.37}, 
     {Pavo, Pi, 4.34, 272.14, -63.67}, {Pavo, Xi, 4.36, 275.81, -61.48}, 
     {Pavo, Nu, 4.63, 277.84, -62.27}, {Pavo, 1, 4.76, 308.9, -60.58}, 
     {Pavo, Omicron, 5.01, 318.33, -70.13}, {Pavo, Rho, 5.03, 309.4, -61.52}, 
     {Pavo, 2, 5.11, 310.01, -60.55}, {Pavo, Omega, 5.12, 284.65, -60.2}, 
     {Pavo, Upsilon, 5.14, 310.49, -66.77}, {Pavo, SX, 5.2, 322.19, -69.5}, 
     {Pavo, Mu2, 5.3, 300.47, -66.95}, {Pavo, Sigma, 5.4, 312.32, -68.77}, 
     {Pavo, Iota, 5.47, 272.6, -62.}, {Pavo, Psi, 5.7, 321.07, -69.73}, 
     {Pavo, Theta, 5.72, 282.16, -65.08}, {Pavo, Mu1, 5.75, 300.1, -66.95}, 
     {Pegasus, Epsilon, 2.4, 326.05, 9.88}, {Pegasus, Alpha, 2.5, 346.19, 
      15.2}, {Pegasus, Beta, 2.56, 345.95, 28.08}, {Pegasus, Gamma, 2.83, 
      3.31, 15.18}, {Pegasus, Eta, 2.95, 340.75, 30.22}, 
     {Pegasus, Zeta, 3.39, 340.36, 10.83}, {Pegasus, Mu, 3.49, 342.5, 24.6}, 
     {Pegasus, Theta, 3.51, 332.55, 6.2}, {Pegasus, Iota, 3.76, 331.75, 
      25.33}, {Pegasus, Lambda, 3.95, 341.63, 23.57}, 
     {Pegasus, 1, 4.08, 320.52, 19.82}, {Pegasus, Kappa, 4.14, 326.16, 
      25.65}, {Pegasus, Xi, 4.2, 341.68, 12.18}, {Pegasus, Pi, 4.3, 332.5, 
      33.17}, {Pegasus, 9, 4.32, 326.13, 17.35}, {Pegasus, Upsilon, 4.41, 
      351.34, 23.4}, {Pegasus, 55, 4.52, 346.75, 9.4}, 
     {Pegasus, 70, 4.54, 352.29, 12.77}, {Pegasus, 2, 4.55, 322.49, 23.63}, 
     {Pegasus, Tau, 4.58, 350.16, 23.75}, {Pegasus, Psi, 4.64, 359.44, 
      25.13}, {Pegasus, 56, 4.76, 346.77, 25.47}, {Pegasus, 32, 4.79, 335.33, 
      28.33}, {Pegasus, 35, 4.79, 336.97, 4.7}, {Pegasus, Chi, 4.8, 3.65, 
      20.2}, {Pegasus, Omicron, 4.81, 340.44, 29.3}, 
     {Pegasus, Nu, 4.84, 331.42, 5.05}, {Pegasus, Rho, 4.9, 343.81, 8.82}, 
     {Pegasus, 78, 4.93, 356., 29.35}, {Pegasus, 72, 4.97, 353.49, 31.32}, 
     {Pegasus, 31, 5., 335.38, 12.2}, {Pegasus, Phi, 5.05, 358.12, 19.12}, 
     {Pegasus, 14, 5.06, 327.46, 30.18}, {Pegasus, 16, 5.06, 328.27, 25.92}, 
     {Pegasus, 77, 5.06, 355.84, 10.33}, {Pegasus, 66, 5.08, 350.77, 12.32}, 
     {Pegasus, 57, 5.14, 347.38, 8.68}, {Pegasus, 59, 5.15, 347.93, 8.73}, 
     {Pegasus, Sigma, 5.16, 343.1, 9.83}, {Pegasus, 13, 5.24, 327.53, 17.28}, 
     {Pegasus, 12, 5.29, 326.52, 22.95}, {Pegasus, 82, 5.29, 358.15, 10.93}, 
     {Pegasus, 64, 5.33, 350.48, 31.82}, {Pegasus, 7, 5.34, 325.56, 5.67}, 
     {Pegasus, 71, 5.34, 353.37, 22.5}, {Pegasus, 5, 5.36, 324.44, 19.32}, 
     {Pegasus, 30, 5.36, 335.12, 5.78}, {Pegasus, 58, 5.38, 347.5, 9.83}, 
     {Pegasus, 75, 5.4, 354.49, 18.4}, {Pegasus, 38, 5.47, 337.5, 32.58}, 
     {Pegasus, 51, 5.48, 344.37, 20.77}, {Pegasus, 86, 5.48, 1.43, 13.38}, 
     {Pegasus, 87, 5.48, 2.26, 18.2}, {Pegasus, 37, 5.49, 337.49, 4.42}, 
     {Pegasus, 15, 5.51, 328.12, 28.8}, {Pegasus, 17, 5.56, 329.24, 12.08}, 
     {Pegasus, 73, 5.56, 353.66, 33.5}, {Pegasus, 36, 5.57, 337.28, 9.13}, 
     {Pegasus, 67, 5.57, 351.21, 32.38}, {Pegasus, 27, 5.58, 332.31, 33.17}, 
     {Pegasus, 23, 5.59, 331.4, 28.97}, {Pegasus, 34, 5.61, 336.65, 4.4}, 
     {Pegasus, 20, 5.62, 330.27, 13.12}, {Pegasus, 11, 5.63, 326.81, 2.68}, 
     {Pegasus, 19, 5.64, 330.29, 8.27}, {Pegasus, 63, 5.65, 350.21, 30.42}, 
     {Pegasus, 4, 5.66, 324.63, 5.77}, {Pegasus, 21, 5.7, 330.83, 11.38}, 
     {Pegasus, 40, 5.72, 339.72, 19.52}, {Pegasus, 52, 5.72, 344.8, 11.73}, 
     {Pegasus, 85, 5.75, 0.54, 27.08}, {Pegasus, 25, 5.78, 331.96, 21.7}, 
     {Perseus, Alpha, 1.8, 51.08, 49.85}, {Perseus, Beta, 2.15, 47.05, 
      40.95}, {Perseus, Zeta, 2.85, 58.53, 31.88}, {Perseus, Epsilon, 2.89, 
      59.46, 40.}, {Perseus, Gamma, 2.94, 46.2, 53.5}, 
     {Perseus, Delta, 3.02, 55.73, 47.78}, {Perseus, Rho, 3.5, 46.3, 38.83}, 
     {Perseus, Eta, 3.77, 42.67, 55.9}, {Perseus, Nu, 3.77, 56.3, 42.58}, 
     {Perseus, Kappa, 3.79, 47.38, 44.87}, {Perseus, Omicron, 3.83, 56.08, 
      32.28}, {Perseus, Tau, 3.95, 43.57, 52.77}, {Perseus, 48, 4.03, 62.17, 
      47.72}, {Perseus, Xi, 4.04, 59.74, 35.78}, {Perseus, Iota, 4.05, 47.27, 
      49.62}, {Perseus, Phi, 4.06, 25.91, 50.68}, {Perseus, Theta, 4.11, 
      41.05, 49.22}, {Perseus, Mu, 4.13, 63.73, 48.4}, 
     {Perseus, 16, 4.22, 42.65, 38.32}, {Perseus, 58, 4.23, 69.17, 41.27}, 
     {Perseus, Psi, 4.23, 54.12, 48.2}, {Perseus, Lambda, 4.29, 61.65, 
      50.35}, {Perseus, Sigma, 4.35, 52.64, 48.}, {Perseus, 17, 4.54, 42.88, 
      35.07}, {Perseus, B, 4.59, 64.56, 50.3}, {Perseus, Omega, 4.61, 47.82, 
      39.62}, {Perseus, 34, 4.67, 52.34, 49.52}, {Perseus, 52, 4.7, 63.73, 
      40.48}, {Perseus, Pi, 4.7, 44.69, 39.67}, {Perseus, 53, 4.85, 65.39, 
      46.5}, {Perseus, 12, 4.9, 40.56, 40.18}, {Perseus, 54, 4.93, 65.1, 
      34.57}, {Perseus, 24, 4.94, 44.77, 35.18}, {Perseus, 32, 4.94, 50.36, 
      43.33}, {Perseus, 40, 4.96, 55.59, 33.97}, {Perseus, 4, 5., 30.57, 
      54.48}, {Perseus, 31, 5.04, 49.78, 50.1}, {Perseus, 42, 5.09, 57.38, 
      33.08}, {Perseus, 21, 5.1, 44.32, 31.93}, {Perseus, 29, 5.15, 49.66, 
      50.22}, {Perseus, 9, 5.18, 35.59, 55.83}, {Perseus, 43, 5.27, 59.15, 
      50.68}, {Perseus, 59, 5.3, 70.73, 43.35}, {Perseus, 36, 5.31, 53.11, 
      46.05}, {Perseus, 20, 5.4, 43.43, 38.33}, {Perseus, 14, 5.43, 41.02, 
      44.3}, {Perseus, 30, 5.47, 49.45, 44.02}, {Perseus, 1, 5.52, 28., 
      55.15}, {Perseus, 50, 5.52, 62.15, 38.05}, {Perseus, 55, 5.54, 66.12, 
      34.13}, {Perseus, 2, 5.62, 28.04, 50.8}, {Perseus, 11, 5.65, 40.76, 
      55.12}, {Perseus, 3, 5.67, 29.64, 49.2}, {Perseus, 56, 5.73, 66.15, 
      33.97}, {Perseus, 8, 5.75, 34.5, 57.9}, {Phoenix, Alpha, 2.39, 6.57, 
      -42.3}, {Phoenix, Beta, 3.3, 16.52, -46.72}, {Phoenix, Gamma, 3.4, 
      22.09, -43.32}, {Phoenix, Epsilon, 3.87, 2.35, -45.75}, 
     {Phoenix, Delta, 3.93, 22.81, -49.08}, {Phoenix, Kappa, 3.93, 6.55, 
      -43.68}, {Phoenix, Zeta, 3.94, 17.1, -55.25}, 
     {Phoenix, Eta, 4.36, 10.84, -57.47}, {Phoenix, Psi, 4.4, 28.41, -46.32}, 
     {Phoenix, Mu, 4.58, 10.33, -46.08}, {Phoenix, Iota, 4.7, 353.77, 
      -42.62}, {Phoenix, Iota, 4.7, 353.77, -42.62}, 
     {Phoenix, Lambda1, 4.76, 7.85, -48.8}, {Phoenix, Nu, 4.95, 18.8, 
      -45.53}, {Phoenix, Pi, 5.1, 359.73, -52.73}, {Phoenix, Phi, 5.11, 
      28.59, -42.5}, {Phoenix, Chi, 5.13, 30.43, -44.72}, 
     {Phoenix, Sigma, 5.17, 356.82, -50.23}, {Phoenix, Upsilon, 5.2, 16.95, 
      -41.48}, {Phoenix, Rho, 5.21, 12.67, -50.98}, 
     {Phoenix, Lambda2, 5.52, 8.92, -48.}, {Phoenix, Xi, 5.69, 10.44, -56.5}, 
     {Phoenix, Tau, 5.7, 0.27, -48.82}, {Pictor, Alpha, 3.26, 102.05, 
      -61.93}, {Pictor, Beta, 3.84, 86.82, -51.07}, 
     {Pictor, Gamma, 4.5, 87.46, -56.15}, {Pictor, Delta, 4.8, 92.58, 
      -54.97}, {Pictor, Eta2, 5.02, 76.24, -49.58}, 
     {Pictor, Lambda, 5.3, 70.7, -50.48}, {Pictor, Eta1, 5.38, 75.7, -49.17}, 
     {Pictor, Zeta, 5.44, 79.84, -50.62}, {Pictor, Iota, 5.6, 72.73, -53.47}, 
     {Pictor, Nu, 5.6, 95.73, -56.37}, {Pictor, Mu, 5.78, 97.99, -58.77}, 
     {PiscisAustrinus, Alpha, 1.15, 344.41, -29.62}, 
     {PiscisAustrinus, Epsilon, 4.17, 340.17, -27.05}, 
     {PiscisAustrinus, Delta, 4.2, 343.99, -32.53}, 
     {PiscisAustrinus, Beta, 4.28, 337.88, -32.35}, 
     {PiscisAustrinus, Iota, 4.33, 326.24, -33.03}, 
     {PiscisAustrinus, Gamma, 4.46, 343.13, -32.87}, 
     {PiscisAustrinus, Mu, 4.49, 332.1, -33.}, {PiscisAustrinus, Tau, 4.92, 
      332.53, -32.55}, {PiscisAustrinus, Upsilon, 4.99, 332.11, -34.05}, 
     {PiscisAustrinus, Theta, 5.01, 326.93, -30.9}, 
     {PiscisAustrinus, Pi, 5.11, 345.88, -34.75}, {PiscisAustrinus, Eta, 
      5.41, 330.21, -28.45}, {PiscisAustrinus, Lambda, 5.43, 333.58, -27.77}, 
     {PiscisAustrinus, 8, 5.71, 324.05, -26.17}, {Pisces, Eta, 3.62, 22.87, 
      15.35}, {Pisces, Gamma, 3.69, 349.29, 3.28}, {Pisces, Omega, 4.02, 
      359.83, 6.87}, {Pisces, Iota, 4.13, 354.99, 5.63}, 
     {Pisces, Omicron, 4.26, 26.35, 9.15}, {Pisces, Theta, 4.27, 351.99, 
      6.38}, {Pisces, Epsilon, 4.27, 15.73, 7.88}, {Pisces, Alpha, 4.33, 
      30.51, 2.77}, {Pisces, 30, 4.41, 0.49, -6.02}, 
     {Pisces, Delta, 4.43, 12.17, 7.58}, {Pisces, Nu, 4.44, 25.36, 5.48}, 
     {Pisces, Lambda, 4.5, 355.51, 1.78}, {Pisces, Tau, 4.5, 17.92, 30.1}, 
     {Pisces, Beta, 4.52, 345.97, 3.82}, {Pisces, 33, 4.61, 1.33, -5.7}, 
     {Pisces, Xi, 4.61, 28.39, 3.2}, {Pisces, Phi, 4.65, 18.44, 24.58}, 
     {Pisces, Psi, 4.65, 17.87, 21.03}, {Pisces, TV, 4.7, 7.01, 17.88}, 
     {Pisces, Upsilon, 4.76, 19.87, 27.27}, {Pisces, Mu, 4.83, 22.55, 6.15}, 
     {Pisces, 27, 4.86, 359.67, -3.57}, {Pisces, Kappa, 4.92, 351.73, 1.25}, 
     {Pisces, 7, 5.05, 350.09, 5.38}, {Pisces, 19, 5.05, 356.6, 3.48}, 
     {Pisces, 64, 5.07, 12.24, 16.93}, {Pisces, 29, 5.1, 0.45, -3.03}, 
     {Pisces, 82, 5.16, 17.78, 31.43}, {Pisces, 89, 5.16, 19.45, 3.62}, 
     {Pisces, Zeta, 5.24, 18.43, 7.58}, {Pisces, Rho, 5.26, 21.56, 19.17}, 
     {Pisces, 91, 5.3, 20.28, 28.73}, {Pisces, Psi1, 5.34, 16.42, 21.47}, 
     {Pisces, 41, 5.36, 5.15, 8.18}, {Pisces, 55, 5.36, 9.98, 21.43}, 
     {Pisces, 57, 5.36, 11.64, 15.48}, {Pisces, 5, 5.39, 347.17, 2.13}, 
     {Pisces, 52, 5.4, 8.15, 20.3}, {Pisces, 2, 5.42, 344.86, 0.97}, 
     {Pisces, 20, 5.48, 356.98, -2.77}, {Pisces, 34, 5.5, 2.51, 11.13}, 
     {Pisces, 94, 5.5, 21.68, 19.23}, {Pisces, Psi3, 5.5, 17.45, 19.65}, 
     {Pisces, Sigma, 5.5, 15.7, 31.8}, {Pisces, 80, 5.51, 17.09, 5.65}, 
     {Pisces, 58, 5.52, 11.75, 11.98}, {Pisces, 68, 5.54, 14.46, 28.98}, 
     {Pisces, 22, 5.55, 357.99, 2.92}, {Pisces, Pi, 5.56, 24.28, 12.15}, 
     {Pisces, Psi1, 5.56, 16.43, 21.47}, {Pisces, 72, 5.58, 16.27, 14.93}, 
     {Pisces, Psi2, 5.58, 16.99, 20.73}, {Pisces, 16, 5.66, 354.1, 2.1}, 
     {Pisces, 32, 5.68, 0.63, 8.48}, {Pisces, 51, 5.68, 8.1, 6.95}, 
     {Pisces, 66, 5.7, 13.65, 19.2}, {Pisces, 21, 5.75, 357.36, 1.07}, 
     {Pisces, 44, 5.75, 6.35, 1.93}, {Puppis, Zeta, 2.25, 120.9, -40.}, 
     {Puppis, Pi, 2.7, 109.29, -37.1}, {Puppis, Rho, 2.81, 121.89, -24.3}, 
     {Puppis, Tau, 2.92, 102.48, -50.62}, {Puppis, Nu, 3.17, 99.44, -43.18}, 
     {Puppis, Sigma, 3.24, 112.31, -43.3}, {Puppis, Xi, 3.35, 117.32, 
      -24.87}, {Puppis, 3, 3.96, 115.95, -28.95}, {Puppis, 11, 4.2, 119.22, 
      -22.88}, {Puppis, V, 4.3, 119.56, -49.23}, {Puppis, 16, 4.4, 122.26, 
      -19.25}, {Puppis, M47, 4.5, 114.29, -14.5}, {Puppis, 1, 4.58, 115.88, 
      -28.4}, {Puppis, 19, 4.71, 122.82, -12.93}, {Puppis, 20, 4.98, 123.33, 
      -15.78}, {Puppis, 4, 5.04, 116.4, -14.57}, {Puppis, 12, 5.1, 119.77, 
      -23.3}, {Puppis, 6, 5.18, 117.42, -17.22}, {Puppis, 9, 5.18, 117.94, 
      -13.9}, {Puppis, 5, 5.52, 116.99, -12.2}, {Puppis, 18, 5.53, 122.67, 
      -13.8}, {Puppis, 2, 5.64, 116.37, -14.7}, {Puppis, 10, 5.69, 118.08, 
      -14.83}, {Pyxis, Alpha, 3.69, 130.9, -33.2}, 
     {Pyxis, Beta, 3.97, 130.03, -35.3}, {Pyxis, Gamma, 4.01, 132.63, -27.7}, 
     {Pyxis, Kappa, 4.59, 137.01, -25.85}, {Pyxis, Lambda, 4.7, 140.8, 
      -28.83}, {Pyxis, Theta, 4.72, 140.38, -25.97}, 
     {Pyxis, Zeta, 4.86, 129.92, -29.55}, {Pyxis, Delta, 4.88, 133.88, 
      -27.68}, {Pyxis, Eta, 5.26, 129.47, -26.25}, {Pyxis, Epsilon, 5.58, 
      137.48, -30.35}, {Reticulum, Alpha, 3.34, 63.6, -62.47}, 
     {Reticulum, Beta, 3.84, 56.05, -64.8}, {Reticulum, Epsilon, 4.44, 64.12, 
      -59.32}, {Reticulum, Gamma, 4.51, 60.23, -62.15}, 
     {Reticulum, Delta, 4.55, 59.69, -61.4}, {Reticulum, Kappa, 4.7, 52.35, 
      -62.93}, {Reticulum, Iota, 4.96, 60.33, -61.08}, 
     {Reticulum, Eta, 5.23, 65.47, -63.38}, {Reticulum, Zeta2, 5.23, 49.55, 
      -62.5}, {Reticulum, Zeta1, 5.53, 49.44, -62.57}, 
     {Sculptor, Alpha, 4.3, 14.65, -29.37}, {Sculptor, Beta, 4.37, 353.25, 
      -37.82}, {Sculptor, Gamma, 4.41, 349.71, -32.53}, 
     {Sculptor, Delta, 4.56, 357.23, -28.13}, {Sculptor, Eta, 4.82, 6.98, 
      -33.02}, {Sculptor, Zeta, 5.02, 0.58, -29.73}, 
     {Sculptor, Iota, 5.17, 5.38, -28.98}, {Sculptor, Theta, 5.24, 2.93, 
      -35.13}, {Sculptor, Pi, 5.26, 25.54, -32.33}, 
     {Sculptor, Epsilon, 5.3, 26.41, -25.05}, {Sculptor, Mu, 5.3, 355.16, 
      -32.08}, {Sculptor, Kappa1, 5.4, 2.34, -28.}, 
     {Sculptor, Sigma, 5.51, 15.61, -31.55}, {Sculptor, Kappa2, 5.56, 2.9, 
      -27.8}, {Sculptor, Xi, 5.59, 15.33, -38.92}, {Sculptor, Tau, 5.68, 
      24.03, -29.9}, {Sculptor, R, 5.77, 21.74, -32.55}, 
     {Scorpius, Alpha, 1.08, 247.35, -26.43}, {Scorpius, Lambda, 1.62, 263.4, 
      -37.1}, {Scorpius, Theta, 1.86, 264.33, -43.}, 
     {Scorpius, Delta, 2.3, 240.08, -22.62}, {Scorpius, Epsilon, 2.3, 252.54, 
      -34.3}, {Scorpius, Kappa, 2.41, 265.62, -39.03}, 
     {Scorpius, Beta1, 2.63, 241.36, -19.8}, {Scorpius, Upsilon, 2.7, 262.69, 
      -37.3}, {Scorpius, Tau, 2.83, 248.97, -28.22}, 
     {Scorpius, Sigma, 2.88, 245.3, -25.58}, {Scorpius, Pi, 2.9, 239.71, 
      -26.12}, {Scorpius, Iota1, 3.03, 266.9, -40.12}, 
     {Scorpius, Mu1, 3.14, 252.97, -38.05}, {Scorpius, Eta, 3.33, 258.04, 
      -43.23}, {Scorpius, Mu2, 3.56, 253.08, -38.02}, 
     {Scorpius, Zeta, 3.63, 253.65, -42.35}, {Scorpius, Rho, 3.88, 239.23, 
      -29.22}, {Scorpius, Omega1, 3.97, 241.7, -20.67}, 
     {Scorpius, Nu, 4., 243., -19.47}, {Scorpius, Xi, 4.16, 241.09, -11.38}, 
     {Scorpius, Omega2, 4.32, 241.85, -20.87}, {Scorpius, Omicron, 4.54, 
      245.16, -24.17}, {Scorpius, 13, 4.57, 243.08, -27.93}, 
     {Scorpius, 2, 4.6, 238.4, -25.33}, {Scorpius, 1, 4.64, 237.75, -25.75}, 
     {Scorpius, 22, 4.79, 247.55, -25.12}, {Scorpius, Iota2, 4.8, 267.55, 
      -40.08}, {Scorpius, Beta2, 4.92, 241.36, -19.8}, 
     {Scorpius, Psi, 4.93, 243., -10.07}, {Scorpius, Chi, 5.22, 243.46, 
      -11.83}, {Scorpius, 16, 5.42, 243.03, -8.55}, 
     {Scorpius, 27, 5.47, 254.3, -33.27}, {Scorpius, 18, 5.5, 243.9, -8.37}, 
     {Scorpius, 4, 5.61, 238.88, -26.27}, {Scorpius, 11, 5.64, 241.9, 
      -12.75}, {Scorpius, 12, 5.66, 243.07, -28.42}, 
     {Scutum, Alpha, 3.84, 278.8, -8.25}, {Scutum, Beta, 4.22, 281.79, 
      -4.75}, {Scutum, Zeta, 4.68, 275.92, -8.93}, {Scutum, Gamma, 4.7, 
      277.3, -14.57}, {Scutum, R, 4.7, 281.87, -5.72}, 
     {Scutum, Delta, 4.72, 280.57, -9.05}, {Scutum, Eta, 4.82, 284.26, 
      -5.85}, {Scutum, Epsilon, 4.89, 280.88, -8.27}, 
     {Serpens, Alpha, 2.65, 236.07, 6.42}, {Serpens, Eta, 3.25, 275.32, 
      -2.88}, {Serpens, Xi, 3.54, 264.4, -15.4}, {Serpens, Mu, 3.55, 237.4, 
      -3.42}, {Serpens, Beta, 3.67, 236.55, 15.42}, 
     {Serpens, Epsilon, 3.71, 237.7, 4.48}, {Serpens, Gamma, 3.84, 239.11, 
      15.65}, {Serpens, Kappa, 4.1, 237.18, 18.13}, 
     {Serpens, Delta, 4.23, 233.7, 10.53}, {Serpens, Omicron, 4.25, 265.35, 
      -12.87}, {Serpens, Nu, 4.33, 260.2, -12.85}, {Serpens, Lambda, 4.43, 
      236.61, 7.35}, {Serpens, Iota, 4.51, 235.38, 19.68}, 
     {Serpens, Zeta, 4.61, 270.12, -3.68}, {Serpens, Theta1, 4.62, 284.05, 
      4.2}, {Serpens, Rho, 4.75, 237.81, 20.98}, {Serpens, Sigma, 4.81, 
      245.52, 1.03}, {Serpens, Pi, 4.82, 240.57, 22.8}, 
     {Serpens, Theta2, 4.97, 284.06, 4.2}, {Serpens, 5, 5.06, 229.82, 1.77}, 
     {Serpens, 36, 5.1, 237.81, -3.08}, {Serpens, 10, 5.15, 232.16, 1.83}, 
     {Serpens, Tau1, 5.17, 231.45, 15.43}, {Serpens, D, 5.21, 276.8, 0.2}, 
     {Serpens, 16, 5.26, 234.12, 10.02}, {Serpens, Omega, 5.26, 237.57, 2.2}, 
     {Serpens, 3, 5.32, 228.8, 4.95}, {Serpens, Chi, 5.33, 235.45, 12.85}, 
     {Serpens, 6, 5.34, 230.25, 0.72}, {Serpens, 60, 5.38, 277.42, -1.98}, 
     {Serpens, 25, 5.4, 236.52, -1.8}, {Serpens, 11, 5.5, 233.24, -1.18}, 
     {Serpens, Phi, 5.53, 239.31, 14.42}, {Serpens, 64, 5.56, 284.32, 2.53}, 
     {Serpens, R, 5.6, 237.67, 15.13}, {Serpens, 4, 5.62, 228.95, 0.38}, 
     {Serpens, 45, 5.63, 241.9, 9.9}, {Serpens, Upsilon, 5.7, 236.83, 14.1}, 
     {Serpens, 47, 5.72, 242.12, 8.53}, {Serpens, Tau7, 5.72, 235.48, 18.47}, 
     {Sextans, Alpha, 4.49, 151.98, -0.37}, {Sextans, Gamma, 5.05, 148.12, 
      -8.1}, {Sextans, Beta, 5.06, 157.57, -0.63}, {Sextans, Delta, 5.22, 
      157.37, -2.75}, {Sextans, Epsilon, 5.24, 154.41, -8.07}, 
     {Sextans, 18, 5.63, 152.73, -8.43}, {Sextans, 19, 5.76, 153.2, 4.62}, 
     {Sextans, 35, 5.78, 160.84, 4.75}, {Sextans, 41, 5.78, 162.57, -8.9}, 
     {Sagitta, Gamma, 3.48, 299.69, 19.48}, {Sagitta, Delta, 3.8, 296.85, 
      18.53}, {Sagitta, Alpha, 4.36, 295.02, 18.02}, 
     {Sagitta, Beta, 4.37, 295.26, 17.48}, {Sagitta, Zeta, 5.02, 297.24, 
      19.13}, {Sagitta, Eta, 5.09, 301.29, 19.98}, 
     {Sagitta, 11, 5.33, 299.44, 16.78}, {Sagitta, 13, 5.39, 300.01, 17.52}, 
     {Sagitta, S, 5.4, 299.01, 16.63}, {Sagitta, 1, 5.64, 288.82, 21.22}, 
     {Sagitta, Epsilon, 5.65, 294.32, 16.45}, {Sagitta, 15, 5.78, 301.03, 
      17.07}, {Sagittarius, Epsilon, 1.83, 276.04, -34.38}, 
     {Sagittarius, Sigma, 2.06, 283.82, -26.3}, {Sagittarius, Zeta, 2.6, 
      285.65, -29.87}, {Sagittarius, Delta, 2.69, 275.25, -29.82}, 
     {Sagittarius, Lambda, 2.83, 276.99, -25.43}, {Sagittarius, Pi, 2.89, 
      287.44, -21.02}, {Sagittarius, Gamma, 2.99, 271.45, -30.43}, 
     {Sagittarius, Eta, 3.11, 274.41, -36.77}, {Sagittarius, Phi, 3.18, 
      281.42, -27.}, {Sagittarius, Tau, 3.31, 286.73, -27.67}, 
     {Sagittarius, Xi2, 3.5, 284.43, -21.1}, {Sagittarius, Omicron, 3.76, 
      286.17, -21.73}, {Sagittarius, Mu, 3.86, 273.44, -21.05}, 
     {Sagittarius, Rho1, 3.93, 290.42, -17.85}, {Sagittarius, Alpha, 3.96, 
      290.97, -40.62}, {Sagittarius, Beta1, 4.01, 290.66, -44.47}, 
     {Sagittarius, Iota, 4.12, 298.82, -41.87}, {Sagittarius, X2, 4.2, 
      266.89, -27.83}, {Sagittarius, Beta2, 4.28, 290.8, -44.8}, 
     {Sagittarius, W, 4.3, 271.25, -29.58}, {Sagittarius, Theta1, 4.35, 
      299.93, -35.28}, {Sagittarius, 62, 4.5, 300.67, -27.7}, 
     {Sagittarius, 59, 4.52, 299.24, -27.17}, {Sagittarius, 52, 4.59, 294.18, 
      -24.88}, {Sagittarius, Upsilon, 4.61, 290.43, -15.97}, 
     {Sagittarius, Omega, 4.7, 298.96, -26.3}, {Sagittarius, 4, 4.75, 269.95, 
      -23.82}, {Sagittarius, 21, 4.81, 276.34, -20.55}, 
     {Sagittarius, Nu1, 4.82, 283.54, -22.75}, {Sagittarius, 60, 4.83, 
      299.74, -26.2}, {Sagittarius, Psi, 4.85, 288.89, -25.27}, 
     {Sagittarius, 56, 4.86, 296.59, -19.77}, {Sagittarius, 43, 4.96, 289.41, 
      -18.95}, {Sagittarius, Nu2, 4.99, 283.78, -22.68}, 
     {Sagittarius, 1, 5.02, 272.93, -23.7}, {Sagittarius, 61, 5.02, 299.49, 
      -15.48}, {Sagittarius, Chi1, 5.02, 291.32, -24.5}, 
     {Sagittarius, 55, 5.05, 295.63, -16.13}, {Sagittarius, Xi1, 5.06, 
      284.33, -20.65}, {Sagittarius, 29, 5.3, 282.42, -20.32}, 
     {Sagittarius, 54, 5.31, 295.18, -16.28}, {Sagittarius, Theta2, 5.34, 
      299.96, -34.7}, {Sagittarius, 7, 5.35, 270.71, -24.28}, 
     {Sagittarius, 15, 5.38, 273.8, -20.72}, {Sagittarius, Psi, 5.4, 275.35, 
      -18.85}, {Sagittarius, Chi3, 5.42, 291.38, -23.95}, 
     {Sagittarius, 14, 5.47, 273.56, -21.7}, {Sagittarius, 50, 5.58, 291.58, 
      -21.77}, {Sagittarius, Kappa1, 5.58, 305.61, -42.05}, 
     {Sagittarius, 18, 5.59, 276.26, -30.75}, {Sagittarius, Kappa2, 5.63, 
      305.97, -42.43}, {Sagittarius, 51, 5.66, 294., -24.72}, 
     {Sagittarius, 33, 5.69, 283.5, -21.37}, {Sagittarius, 24, 5.71, 278.47, 
      -24.03}, {Sagittarius, 63, 5.76, 300.5, -13.63}, 
     {Taurus, Alpha, 0.86, 68.98, 16.5}, {Taurus, Beta, 1.65, 81.57, 28.6}, 
     {Taurus, Eta, 2.87, 56.87, 24.12}, {Taurus, Zeta, 2.98, 84.41, 21.15}, 
     {Taurus, Theta2, 3.41, 67.17, 15.87}, {Taurus, Lambda, 3.41, 60.17, 
      12.48}, {Taurus, Epsilon, 3.53, 67.15, 19.18}, 
     {Taurus, Omicron, 3.59, 51.2, 9.03}, {Taurus, 27, 3.63, 57.29, 24.05}, 
     {Taurus, Gamma, 3.63, 64.95, 15.62}, {Taurus, 17, 3.7, 56.22, 24.12}, 
     {Taurus, Xi, 3.72, 51.79, 9.73}, {Taurus, Delta, 3.76, 65.73, 17.53}, 
     {Taurus, Theta1, 3.85, 67.15, 15.95}, {Taurus, 20, 3.88, 56.45, 24.37}, 
     {Taurus, Nu, 3.9, 60.79, 6.}, {Taurus, M45, 4., 56.87, 24.13}, 
     {Taurus, 5, 4.11, 52.72, 12.95}, {Taurus, 23, 4.18, 56.58, 23.95}, 
     {Taurus, Kappa, 4.22, 66.34, 22.3}, {Taurus, 88, 4.25, 68.92, 10.15}, 
     {Taurus, 90, 4.27, 69.54, 12.52}, {Taurus, 10, 4.28, 54.22, 0.4}, 
     {Taurus, Tau, 4.28, 70.56, 22.97}, {Taurus, Mu, 4.29, 63.88, 8.9}, 
     {Taurus, Upsilon, 4.29, 66.58, 22.82}, {Taurus, 68, 4.3, 66.37, 17.93}, 
     {Taurus, 19, 4.3, 56.3, 24.47}, {Taurus, 37, 4.36, 61.17, 22.08}, 
     {Taurus, 71, 4.49, 66.59, 15.62}, {Taurus, Iota, 4.64, 75.78, 21.6}, 
     {Taurus, Rho, 4.65, 68.46, 14.85}, {Taurus, Sigma2, 4.68, 69.82, 15.92}, 
     {Taurus, Pi, 4.69, 66.65, 14.72}, {Taurus, 67, 4.76, 66.36, 22.2}, 
     {Taurus, 64, 4.8, 66.02, 17.45}, {Taurus, 47, 4.83, 63.48, 9.27}, 
     {Taurus, Phi, 4.95, 65.09, 27.35}, {Taurus, 75, 4.96, 67.11, 16.35}, 
     {Taurus, Omega, 4.96, 64.32, 20.58}, {Taurus, 79, 5.02, 67.21, 13.05}, 
     {Taurus, 28, 5.05, 57.3, 24.13}, {Taurus, 30, 5.06, 57.07, 11.13}, 
     {Taurus, Sigma1, 5.07, 69.79, 15.8}, {Taurus, 97, 5.1, 72.84, 18.83}, 
     {Taurus, 66, 5.11, 65.97, 9.47}, {Taurus, 4, 5.13, 52.6, 11.35}, 
     {Taurus, 41, 5.19, 61.65, 27.6}, {Taurus, 58, 5.26, 65.15, 15.08}, 
     {Taurus, 46, 5.28, 63.39, 7.72}, {Taurus, 40, 5.31, 60.94, 5.45}, 
     {Taurus, Psi, 5.32, 61.75, 29.}, {Taurus, 29, 5.34, 56.42, 6.05}, 
     {Taurus, 53, 5.35, 64.86, 21.15}, {Taurus, 72, 5.37, 66.83, 23.}, 
     {Taurus, 56, 5.38, 64.9, 21.77}, {Taurus, 93, 5.38, 70.01, 12.2}, 
     {Taurus, Chi, 5.39, 65.65, 25.63}, {Taurus, 44, 5.4, 62.71, 26.48}, 
     {Taurus, 83, 5.41, 67.66, 13.72}, {Taurus, 16, 5.45, 56.2, 24.28}, 
     {Taurus, 81, 5.48, 67.66, 15.68}, {Taurus, 43, 5.49, 62.29, 19.62}, 
     {Taurus, 98, 5.54, 74.54, 25.05}, {Taurus, 12, 5.56, 54.97, 3.07}, 
     {Taurus, 13, 5.56, 55.58, 19.7}, {Taurus, 36, 5.56, 61.09, 24.12}, 
     {Taurus, 80, 5.58, 67.53, 15.63}, {Taurus, 57, 5.59, 64.99, 14.03}, 
     {Taurus, 63, 5.63, 65.85, 16.78}, {Taurus, 18, 5.65, 56.29, 24.85}, 
     {Taurus, 51, 5.65, 64.6, 21.58}, {Taurus, 31, 5.66, 58., 6.53}, 
     {Taurus, 32, 5.69, 59.22, 22.47}, {Taurus, 45, 5.71, 62.83, 5.53}, 
     {Taurus, 60, 5.72, 65.51, 14.07}, {Taurus, 6, 5.76, 53.15, 9.37}, 
     {Taurus, 21, 5.76, 56.48, 24.57}, {Telescopium, Alpha, 3.5, 276.75, 
      -45.97}, {Telescopium, Zeta, 4.12, 277.21, -49.07}, 
     {Telescopium, Epsilon, 4.53, 272.8, -45.95}, {Telescopium, Iota, 4.88, 
      293.8, -48.1}, {Telescopium, Xi, 4.93, 301.85, -52.88}, 
     {Telescopium, Delta1, 4.95, 277.94, -45.92}, {Telescopium, Lambda, 5.03, 
      284.62, -52.93}, {Telescopium, Eta, 5.04, 290.71, -54.43}, 
     {Telescopium, Rho, 5.15, 286.58, -52.33}, {Telescopium, Kappa, 5.17, 
      283.17, -52.1}, {Telescopium, Delta2, 5.33, 278.01, -45.77}, 
     {Telescopium, Nu, 5.34, 297., -56.37}, {TriangulumAustrale, Alpha, 1.93, 
      252.17, -69.03}, {TriangulumAustrale, Beta, 2.84, 238.79, -63.43}, 
     {TriangulumAustrale, Gamma, 2.89, 229.73, -68.68}, 
     {TriangulumAustrale, Delta, 3.84, 243.86, -63.68}, 
     {TriangulumAustrale, Epsilon, 4.1, 234.18, -66.32}, 
     {TriangulumAustrale, Zeta, 4.89, 247.12, -70.1}, 
     {TriangulumAustrale, Kappa, 5.08, 238.87, -68.6}, 
     {TriangulumAustrale, Iota, 5.3, 246.99, -64.07}, 
     {TriangulumAustrale, Theta, 5.51, 248.94, -65.5}, 
     {Triangulum, Beta, 3., 32.38, 34.98}, {Triangulum, Alpha, 3.41, 28.27, 
      29.58}, {Triangulum, Gamma, 4., 34.33, 33.85}, 
     {Triangulum, Delta, 4.86, 34.26, 34.22}, {Triangulum, 6, 4.94, 33.09, 
      30.3}, {Triangulum, 10, 5.03, 34.74, 28.65}, {Triangulum, 14, 5.15, 
      38.02, 36.15}, {Triangulum, 7, 5.28, 33.98, 33.37}, 
     {Triangulum, 12, 5.28, 37.04, 29.67}, {Triangulum, R, 5.3, 39.26, 
      34.27}, {Triangulum, 15, 5.45, 38.95, 34.68}, 
     {Triangulum, Epsilon, 5.5, 30.74, 33.28}, {Triangulum, 11, 5.72, 36.87, 
      31.8}, {Tucana, Alpha, 2.85, 334.62, -60.25}, 
     {Tucana, Gamma, 3.98, 349.36, -58.23}, {Tucana, Zeta, 4.24, 5.02, 
      -64.88}, {Tucana, Kappa, 4.25, 18.94, -68.87}, 
     {Tucana, Beta1, 4.35, 7.89, -62.97}, {Tucana, Delta, 4.47, 336.83, 
      -64.95}, {Tucana, Epsilon, 4.49, 359.98, -65.58}, 
     {Tucana, Nu, 4.87, 338.25, -61.98}, {Tucana, Eta, 4.99, 359.4, -64.3}, 
     {Tucana, Iota, 5.36, 16.83, -61.78}, {Tucana, Rho, 5.38, 10.62, -65.47}, 
     {Tucana, Lambda2, 5.44, 13.75, -69.53}, {Tucana, Pi, 5.5, 5.16, -69.63}, 
     {UrsaMajor, Alpha, 1.79, 165.93, 61.75}, {UrsaMajor, Epsilon, 1.79, 
      193.51, 55.95}, {UrsaMajor, Eta, 1.88, 206.88, 49.32}, 
     {UrsaMajor, Zeta, 2.27, 200.98, 54.93}, {UrsaMajor, Beta, 2.38, 165.46, 
      56.38}, {UrsaMajor, Gamma, 2.43, 178.45, 53.7}, 
     {UrsaMajor, Psi, 3., 167.42, 44.48}, {UrsaMajor, Mu, 3.03, 155.58, 
      41.5}, {UrsaMajor, Iota, 3.15, 134.8, 48.03}, 
     {UrsaMajor, Theta, 3.18, 143.21, 51.68}, {UrsaMajor, Delta, 3.31, 
      183.86, 57.03}, {UrsaMajor, Omicron, 3.35, 127.57, 60.72}, 
     {UrsaMajor, Lambda, 3.45, 154.28, 42.92}, {UrsaMajor, Nu, 3.46, 169.62, 
      33.08}, {UrsaMajor, Kappa, 3.57, 135.9, 47.15}, 
     {UrsaMajor, 23, 3.66, 142.88, 63.07}, {UrsaMajor, Chi, 3.7, 176.51, 
      47.78}, {UrsaMajor, Upsilon, 3.79, 147.75, 59.05}, 
     {UrsaMajor, 80, 4., 201.3, 55.}, {UrsaMajor, Xi, 4.41, 169.55, 31.53}, 
     {UrsaMajor, 15, 4.47, 137.22, 51.6}, {UrsaMajor, 26, 4.49, 143.71, 
      52.05}, {UrsaMajor, 24, 4.55, 143.62, 69.83}, 
     {UrsaMajor, Phi, 4.57, 148.03, 54.07}, {UrsaMajor, Pi2, 4.59, 130.05, 
      64.33}, {UrsaMajor, 83, 4.66, 205.19, 54.68}, 
     {UrsaMajor, Omega, 4.67, 163.49, 43.18}, {UrsaMajor, Tau, 4.67, 137.73, 
      63.52}, {UrsaMajor, Rho, 4.76, 135.64, 67.63}, 
     {UrsaMajor, 55, 4.77, 169.78, 38.18}, {UrsaMajor, Sigma2, 4.8, 137.6, 
      67.13}, {UrsaMajor, 18, 4.82, 139.05, 54.02}, 
     {UrsaMajor, 36, 4.83, 157.66, 55.98}, {UrsaMajor, 78, 4.93, 195.18, 
      56.37}, {UrsaMajor, 56, 4.97, 170.7, 43.48}, {UrsaMajor, 46, 5.02, 
      163.93, 33.5}, {UrsaMajor, 47, 5.05, 164.87, 40.43}, 
     {UrsaMajor, 49, 5.06, 165.21, 39.22}, {UrsaMajor, 44, 5.09, 163.39, 
      54.58}, {UrsaMajor, 38, 5.11, 160.49, 65.72}, 
     {UrsaMajor, 37, 5.15, 158.79, 57.08}, {UrsaMajor, 67, 5.15, 180.53, 
      43.05}, {UrsaMajor, Sigma1, 5.15, 137.1, 66.87}, 
     {UrsaMajor, 27, 5.16, 145.74, 72.25}, {UrsaMajor, 16, 5.17, 138.58, 
      61.42}, {UrsaMajor, 17, 5.27, 138.95, 56.73}, 
     {UrsaMajor, 31, 5.27, 148.93, 49.83}, {UrsaMajor, 57, 5.28, 172.27, 
      39.33}, {UrsaMajor, 74, 5.32, 187.49, 58.4}, {UrsaMajor, 61, 5.33, 
      175.26, 34.2}, {UrsaMajor, 82, 5.4, 204.88, 52.93}, 
     {UrsaMajor, 2, 5.46, 128.65, 65.15}, {UrsaMajor, 59, 5.47, 174.59, 
      43.63}, {UrsaMajor, 84, 5.49, 206.65, 54.43}, 
     {UrsaMajor, T, 5.5, 189.1, 59.48}, {UrsaMajor, 81, 5.52, 203.53, 55.35}, 
     {UrsaMajor, 70, 5.55, 185.21, 57.87}, {UrsaMajor, 6, 5.58, 134.15, 
      64.6}, {UrsaMajor, 42, 5.59, 162.85, 59.32}, {UrsaMajor, 43, 5.61, 
      162.8, 56.58}, {UrsaMajor, 73, 5.61, 186.9, 55.72}, 
     {UrsaMajor, Pi1, 5.63, 129.8, 65.02}, {UrsaMajor, 86, 5.65, 208.46, 
      53.72}, {UrsaMajor, 62, 5.66, 175.39, 31.75}, 
     {UrsaMajor, 32, 5.67, 154.51, 65.1}, {UrsaMajor, 5, 5.69, 133.34, 
      61.97}, {UrsaMajor, 22, 5.72, 143.73, 72.2}, {UrsaMajor, 39, 5.78, 
      160.93, 57.18}, {UrsaMinor, Alpha, 2.04, 37.8, 89.25}, 
     {UrsaMinor, Beta, 2.07, 222.68, 74.15}, {UrsaMinor, Gamma, 3.04, 230.18, 
      71.83}, {UrsaMinor, Epsilon, 4.19, 251.49, 82.03}, 
     {UrsaMinor, 5, 4.25, 216.88, 75.68}, {UrsaMinor, Zeta, 4.3, 236.01, 
      77.8}, {UrsaMinor, Delta, 4.35, 263.05, 86.58}, 
     {UrsaMinor, 4, 4.82, 212.21, 77.55}, {UrsaMinor, Eta, 4.94, 244.37, 
      75.75}, {UrsaMinor, Theta, 4.96, 232.85, 77.35}, 
     {UrsaMinor, 11, 5.02, 229.28, 71.82}, {UrsaMinor, 19, 5.48, 242.7, 
      75.88}, {Vela, Gamma, 1.83, 122.38, -47.35}, 
     {Vela, Delta, 1.95, 131.18, -54.72}, {Vela, Lambda, 2.24, 137., -43.43}, 
     {Vela, Kappa, 2.49, 140.53, -55.02}, {Vela, Mu, 2.68, 161.69, -49.43}, 
     {Vela, N, 3.12, 142.8, -57.03}, {Vela, Phi, 3.54, 149.22, -54.58}, 
     {Vela, Psi, 3.58, 142.67, -40.47}, {Vela, Omicron, 3.62, 130.08, 
      -52.92}, {Vela, AH, 5.5, 123., -46.65}, {Virgo, Alpha, 0.97, 201.3, 
      -11.15}, {Virgo, Epsilon, 2.83, 195.55, 10.97}, 
     {Virgo, Zeta, 3.36, 203.67, -0.6}, {Virgo, Delta, 3.37, 193.9, 3.38}, 
     {Virgo, Beta, 3.61, 177.67, 1.77}, {Virgo, Gamma, 3.68, 190.42, -1.45}, 
     {Virgo, Eta, 3.88, 184.98, -0.67}, {Virgo, Mu, 3.88, 220.76, -5.65}, 
     {Virgo, Nu, 4.03, 176.46, 6.52}, {Virgo, Iota, 4.08, 214., -6.}, 
     {Virgo, Omicron, 4.12, 181.3, 8.73}, {Virgo, Kappa, 4.18, 213.23, 
      -10.28}, {Virgo, Tau, 4.26, 210.41, 1.55}, {Virgo, Theta, 4.37, 197.49, 
      -5.53}, {Virgo, Lambda, 4.52, 214.78, -13.38}, 
     {Virgo, Pi, 4.64, 180.22, 6.62}, {Virgo, Chi, 4.65, 189.81, -8.}, 
     {Virgo, 74, 4.68, 202.99, -6.25}, {Virgo, 61, 4.74, 199.6, -18.3}, 
     {Virgo, 69, 4.75, 201.86, -15.97}, {Virgo, Sigma, 4.79, 199.4, 5.47}, 
     {Virgo, Phi, 4.8, 217.05, -2.23}, {Virgo, Psi, 4.8, 193.59, -9.55}, 
     {Virgo, Xi, 4.83, 176.32, 8.27}, {Virgo, Rho, 4.88, 190.47, 10.23}, 
     {Virgo, 78, 4.93, 203.53, 3.65}, {Virgo, 16, 4.95, 185.09, 3.32}, 
     {Virgo, 70, 4.97, 202.1, 13.78}, {Virgo, 82, 5., 205.4, -8.7}, 
     {Virgo, 89, 5.02, 207.47, -18.13}, {Virgo, 53, 5.04, 198.01, -16.2}, 
     {Virgo, Upsilon, 5.13, 214.88, -2.27}, {Virgo, 90, 5.14, 208.67, -1.52}, 
     {Virgo, 49, 5.17, 196.97, -10.73}, {Virgo, 76, 5.2, 203.24, -10.17}, 
     {Virgo, D2, 5.2, 191.4, 7.67}, {Virgo, 57, 5.21, 199., -19.95}, 
     {Virgo, 59, 5.21, 199.2, 9.43}, {Virgo, 68, 5.23, 201.68, -12.7}, 
     {Virgo, 4, 5.3, 176.98, 8.25}, {Virgo, 63, 5.33, 200.75, -17.73}, 
     {Virgo, Omega, 5.34, 174.61, 8.13}, {Virgo, 7, 5.35, 179.99, 3.67}, 
     {Virgo, 84, 5.35, 205.77, 3.55}, {Virgo, 87, 5.44, 206.85, -17.87}, 
     {Virgo, 95, 5.45, 211.68, -9.32}, {Virgo, 21, 5.47, 188.45, -9.45}, 
     {Virgo, 6, 5.57, 178.76, 8.45}, {Virgo, 31, 5.57, 190.49, 6.8}, 
     {Virgo, 83, 5.57, 206.12, -16.18}, {Virgo, 55, 5.63, 198.55, -19.93}, 
     {Virgo, 75, 5.65, 203.22, -15.37}, {Virgo, 33, 5.67, 191.6, 9.53}, 
     {Virgo, 71, 5.68, 202.3, 10.82}, {Virgo, 11, 5.72, 182.52, 5.82}, 
     {Virgo, 80, 5.72, 203.88, -5.4}, {Virgo, 66, 5.75, 201.14, -5.15}, 
     {Virgo, 44, 5.78, 194.91, -3.8}, {Volans, Gamma2, 3.56, 107.19, -70.5}, 
     {Volans, Gamma1, 3.62, 107.18, -70.5}, {Volans, Beta, 3.76, 126.43, 
      -66.13}, {Volans, Zeta, 3.94, 115.45, -72.6}, 
     {Volans, Delta, 3.97, 109.21, -67.95}, {Volans, Alpha, 4., 135.61, 
      -66.4}, {Volans, Epsilon, 4.34, 121.99, -68.62}, 
     {Volans, Theta, 5.19, 129.77, -70.38}, {Volans, Eta, 5.28, 125.52, 
      -73.4}, {Volans, Kappa1, 5.36, 124.95, -71.52}, 
     {Volans, Iota, 5.39, 102.86, -70.95}, {Volans, Kappa2, 5.64, 125., 
      -71.5}, {Vulpecula, Alpha, 4.42, 292.18, 24.67}, 
     {Vulpecula, 23, 4.52, 303.94, 27.8}, {Vulpecula, 13, 4.57, 298.37, 
      24.08}, {Vulpecula, 31, 4.57, 313.03, 27.08}, 
     {Vulpecula, 15, 4.63, 300.27, 27.77}, {Vulpecula, 1, 4.77, 289.05, 
      21.4}, {Vulpecula, 29, 4.8, 309.63, 21.2}, {Vulpecula, 30, 4.9, 311.22, 
      25.27}, {Vulpecula, 12, 4.94, 297.77, 22.6}, 
     {Vulpecula, 32, 5., 313.64, 28.07}, {Vulpecula, 9, 5.02, 293.64, 19.77}, 
     {Vulpecula, 28, 5.05, 309.63, 24.12}, {Vulpecula, 17, 5.07, 301.73, 
      23.62}, {Vulpecula, 4, 5.14, 291.37, 19.8}, {Vulpecula, 22, 5.17, 
      303.88, 23.5}, {Vulpecula, 3, 5.18, 290.71, 26.27}, 
     {Vulpecula, 21, 5.19, 303.56, 28.68}, {Vulpecula, 16, 5.23, 300.5, 
      24.93}, {Vulpecula, 2, 5.3, 289.43, 23.03}, {Vulpecula, 24, 5.32, 
      304.2, 24.67}, {Vulpecula, 33, 5.33, 314.57, 22.32}, 
     {Vulpecula, T, 5.4, 312.87, 28.25}, {Vulpecula, 35, 5.41, 321.92, 27.6}, 
     {Vulpecula, 27, 5.42, 309.27, 26.47}, {Vulpecula, 25, 5.43, 305.51, 
      24.45}, {Vulpecula, 10, 5.47, 295.93, 25.77}, 
     {Vulpecula, 18, 5.51, 302.64, 26.9}, {Vulpecula, 19, 5.51, 302.95, 
      26.82}, {Vulpecula, 5, 5.6, 291.55, 20.1}, {Vulpecula, 14, 5.63, 
      299.79, 23.1}, {Vulpecula, 8, 5.78, 292.24, 24.77}}
 
TheStars /: TheStars::usage = "TheStars is a list of stars for use by the \
various StarChart commands. By default this list is initially set to the 250 \
brightest stars (down to magnitude 3.4), but you can load bigger star \
databases (such as <<Star2500.m or <<Star9000.m) if necessary."
 
satEquatorCoords[satell_, 
     day_, opts___] := 
    Block[{Mean$Longitude, 
      Semi$Major, Perigee$Longitude, 
      Eccentricity, 
      Ascension$Longitude, 
      Orbital$Tilt, Mean$Anomaly, 
      Perigee$Argument, theta, 
      R1, R2, R3, 
      u, v, c3, 
      s3, ascension, 
      declination, distance, 
      epoch}, {Mean$Longitude, 
        Semi$Major, 
        Perigee$Longitude, 
        Eccentricity, 
        Ascension$Longitude, 
        Orbital$Tilt} = 
       OrbitalElements[satell, 
        day, day/36525.]; 
      Mean$Anomaly = 
       Mod[Mean$Longitude - 
         Perigee$Longitude, 360]; 
      Perigee$Argument = 
       Mod[Perigee$Longitude - 
         Ascension$Longitude, 360]; 
      theta = true$anomaly[
        Mean$Anomaly, Eccentricity]; 
      R1 = Perigee$Argument*
        N[Degree]; R2 = Orbital$Tilt*
        N[Degree]; R3 = 
       Ascension$Longitude*N[Degree]; 
      u = Cos[R2]*
        Sin[theta + R1]; 
      v = Cos[theta + 
         R1]; c3 = 
       Cos[R3]; s3 = 
       Sin[R3]; ascension = 
       Mod[ArcTan[c3*v - 
           s3*u, 
          s3*v + 
           c3*u]/N[15*Degree], 24]; 
      declination = 
       ArcSin[Tan[R2]*u]/N[Degree]; 
      distance = (Semi$Major*
         (1 - Eccentricity^2))/
        (1 + Eccentricity*
          Cos[theta]); epoch = 
       Epoch /. {opts} /. Options[EquatorCoordinates]; 
      If[NumberQ[epoch], {ascension, 
         declination} = epochChange[
         day, {ascension, 
          declination}, (epoch - 
           1900.)*365.2425]]; {Ascension -> ascension*
         Hour, Declination -> declination*Degree, 
       Distance -> distance*AU}]
 
satEquatorCoords /: 
    satEquatorCoords::trace = ""
 
Culmination[___] := (Message[Culmination::noavail, Culmination]; )
 
Culmination /: Culmination::noavail = 
     "This is just the demo version, and `1` is not available."
 
Culmination /: Culmination::usage = "Culmination[object, neardate] returns \
the date, nearest to neardate, at which the object (a planet or a star) will \
cross the local Meridian line. If date is omitted the current Date[] is \
used."
 
RiseSet[{ra_, 
      dec_}] := Block[{tandec, 
      h, lstRise, 
      lstSet}, tandec = 
       Tan[dec*N[Degree]]; 
      If[Geo$Latitude < 0, 
       If[dec <= 
          -(90 + Geo$Latitude), 
         Return[{CIRCUMPOLAR, 
           NEVERSETS}]]; If[dec >= 
          90 + Geo$Latitude, 
         Return[{NEVERRISES, 
           INVISIBLE}]]; , 
       If[dec >= 90 - Geo$Latitude, 
         Return[{CIRCUMPOLAR, 
           NEVERSETS}]]; If[dec <= 
          -(90 - Geo$Latitude), 
         Return[{NEVERRISES, 
           INVISIBLE}]]; ]; h = 
       N[-((ArcCos[tandec*
             Tan$Geo$Latitude]*12)/Pi)]; 
      lstRise = Mod[ra - 
         h, 24]; lstSet = 
       Mod[ra + h, 24]; 
      {lstRise, lstSet}]
 
RiseSet /: RiseSet::trace = ""
 
DaylightSaving /: DaylightSaving::trace = ""
 
DaylightSaving /: DaylightSaving::usage = "DaylightSaving is an option to \
RiseSetChart which specifies when daylight saving time will be in effect for \
the given year. The default is None, but you can use Automatic to cause the \
start and stop dates to be computed automatically. This automatic value is \
{{year,5,1}, {year,9,1}} for the northern hemisphere, and {{year,11,1}, \
{year,3,1}} for the southern hemisphere. In general however you can use: \
DaylightSaving -> {startdate, stopdate}."
 
ApparentDiameter /: ApparentDiameter::trace = ""
 
ApparentDiameter /: ApparentDiameter::usage = 
     "ApparentDiameter is a value returned by the AppearanceP command."
 
eText[text_, 
     pos___] := Text[FontForm[text, 
      {"Helvetica", 8}], pos]
 
eText /: eText::trace = ""
 
SolarPerigee[d_] := 
    Block[{T = d/36525.}, 
     281.22081 + T*(1.719173 + T*(0.000453 + T*3.*^-6))]
 
SolarPerigee /: SolarPerigee::trace = 
     ""
 
BestView[___] := (Message[BestView::noavail, BestView]; )
 
BestView /: BestView::noavail = 
     "This is just the demo version, and `1` is not available."
 
BestView /: BestView::usage = "BestView[object, neardate] returns some \
eventdates, nearest to the neardate, at which the object will be at its best \
viewing condition. For planets this is when the object is furthest from the \
Sun in an angular sense, and hence the object will be at its brightest. For \
inner planets (i.e Mercury and Venus) the eventdates are EveningApparition \
(Greatest-Elongation-East) and MorningApparition (Greatest-Elongation-West). \
(See ?EveningApparition and ?MorningApparition for details.) For outer \
planets (such as Mars, Jupiter, Saturn etc) the eventdate is Opposition. (See \
?Opposition for details.) The BestView command also works with low orbit \
Earth satellites. In that case it returns a TransitVisible eventdate. (See \
?TransitVisible for details.) For other objects, such as stars etc, the \
BestView command just returns the Transit time at which the object will cross \
the local Meridian line. (The Culmination command also returns the Transit \
time.) If neardate is omitted the current Date[] is used."
 
degs$and$minOfLongitude[deg_] := 
    StringJoin[degs$and$min[
      Abs[deg]], If[deg < 0, "W", 
      "E"]]
 
degs$and$minOfLongitude /: 
    degs$and$minOfLongitude::trace = ""
 
degs$and$min[Indeterminate] := "Indeterminate"
 
degs$and$min[angle_] := 
    Block[{L, deg, minutes, 
      signAng}, If[angle < 0, 
       signAng = "-", signAng = " "]; 
      L = Abs[angle] + 0.5/60; deg = 
       Floor[L]; L -= deg; minutes = 
       Floor[60*L]; If[deg < 100, 
       signAng = StringJoin[" ", 
         signAng]]; If[deg < 10, 
       signAng = StringJoin[" ", 
         signAng]]; If[minutes < 10, 
       minutes = StringJoin["0", 
         ToString[minutes]], 
       minutes = ToString[minutes]]; 
      StringJoin[signAng, 
       ToString[deg], $DegreeCharacter, 
       minutes, "'"]]
 
degs$and$min /: degs$and$min::trace = 
     ""
 
$DegreeCharacter = "^"
 
$DegreeCharacter /: $DegreeCharacter::usage = "$DegreeCharacter sets the \
string character that you would like to use as a degree symbol. On a \
Macintosh you can use the Option-K character (FromCharacterCode[161]), and \
under Windows you can use FromCharacterCode[176]. But on other platforms a \
different character may need to be chosen."
 
ChartCoordinates[___] := (Message[ChartCoordinates::noavail, 
      ChartCoordinates]; )
 
ChartCoordinates /: ChartCoordinates::noavail = 
     "This is just the demo version, and `1` is not available."
 
ChartCoordinates /: ChartCoordinates::usage = "ChartCoordinates[object, datum] \
returns the ChartPosition coordinates of the object (a planet or a star, or \
Sun, Moon or asteroid) on the given datum. A ChartPosition will eventually be \
evaluated when it is passed via the Epilog or Prolog option to the commands \
StarChart, RadialStarChart, HorizonStarChart or ZenithStarChart. If datum is \
omitted the current Date[] is used."
 
MorningApparition /: MorningApparition::trace = ""
 
MorningApparition /: MorningApparition::usage = "MorningApparition is an \
eventdate output by the BestView command. When an inner planet (i.e Mercury \
or Venus) is at its Greatest Elongation West of the Sun, as viewed from \
Earth, it will be at its highest in the morning sky just before dawn, and \
this is said to be a MorningApparition. The planet will also be furthest from \
the glare of the Sun, and so a MorningApparition eventdate will be the best \
date for viewing a planet in the morning. Before MorningApparition the planet \
will have very quickly moved passed the Sun after being in the evening sky. \
(See ?EveningApparition.) After MorningApparition it will be visible in the \
morning sky. Morning Searches for Mercury can be made at MorningApparition \
eventdates. Searches should start 70 minutes before SunriseP and end 40 \
minutes before SunriseP. The best MorningApparition's to search for Mercury \
are in Autumn."
 
RadialStarChart[___] := (Message[RadialStarChart::noavail, RadialStarChart]; )
 
RadialStarChart /: RadialStarChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
RadialStarChart /: RadialStarChart::usage = "RadialStarChart[object, date] \
plots a circle of the sky centered on the object's position on the given \
date. RadialStarChart[equatorcoords] plots a circle of the sky centered on \
equatorcoords (which is expressed as a list of rules for the Ascension and \
Declination). RadialStarChart[horizoncoords, date] plots a circle of the sky \
centered on horizoncoords (which is expressed as a list of rules for the \
Azimuth and Altitude). RadialStarChart[constellation] plots a circle of the \
sky centered on one of the 88 constellations (eg Andromeda, Crux, etc). (See \
?Constellation`* for a list of the constellations.) The angular field of view \
is by default 20*Degree in radius, but you can change this with the \
RadialAngle option. By default only the brightest 250 stars are used by \
RadialStarChart, but you can load extra stars such as those in the Star2500.m \
file which includes the brightest 2500 stars. You can artificially brighten, \
or fainten, the stars by using the MagnitudeScale option. \
RadialStarChart[object, date, Planets->planets] can be used to show \
additional red dots for the position of the planets on the given date. In \
this form the Sun is indicated with a yellow dot, and the Moon with a gray \
dot. If date is omitted the current Date[] is used. See also ?OrbitTrack for \
a method of superimposing planet tracks. See ?ChartCoordinates and \
?ChartPosition for a more general way of annotating charts. The option \
Horizon->True can be used to draw the line of the Horizon. An example usage \
is: RadialStarChart[NorthCeletialPole, RadialAngle->50*Degree] which will \
display the region centred around the North Celestial Pole. Another example \
is: RadialStarChart[Jupiter, RadialAngle->30*Degree];. Any StarChart option \
can be used with the RadialStarChart command."
 
OuterPlanetChart[___] := (Message[OuterPlanetChart::noavail, 
      OuterPlanetChart]; )
 
OuterPlanetChart /: OuterPlanetChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
OuterPlanetChart /: OuterPlanetChart::usage = "OuterPlanetChart[baseyear] \
produces a graphics showing the position of the Outer planets. The Earth is \
at the centre and the planets, the Sun and stars are shown orbiting it in \
concentric circles. In the graphic, numbers represent the start (Jan 1) of a \
new year starting with the baseyear, and the smaller dots represent months \
within that year. Points closer to the centre (that is Earth) will be \
brighter in apparent magnitude. The positions of Mars and Jupiter are shown \
for the next 15 and 11 years respectively, and Saturn for the next 28 years. \
If baseyear is omitted the current year is used. The graphic produced by \
OuterPlanetChart is only suitable for printing on say a laserprinter. It is \
not intended to be readable on the screen."
 
llty[s_] := 
    (s::trace = ""; Attributes[s] = 
      Union[Attributes[s], 
       {ReadProtected, Protected, 
        Locked}])
 
llty /: llty::trace = ""
 
Locked = Sequence[]
 
PlanetRadius[Callisto] = 2403.
 
PlanetRadius[Ceres] = 470.
 
PlanetRadius[Earth] = 6378.387
 
PlanetRadius[Europa] = 1569.
 
PlanetRadius[Ganymede] = 2631.
 
PlanetRadius[Io] = 1815.
 
PlanetRadius[Jupiter] = 71942.
 
PlanetRadius[Mars] = 3397.2
 
PlanetRadius[Mercury] = 2439.
 
PlanetRadius[Moon] = 1738.
 
PlanetRadius[Neptune] = 25269.
 
PlanetRadius[Pallas] = 290.
 
PlanetRadius[Pluto] = 1162.
 
PlanetRadius[Saturn] = 60268.
 
PlanetRadius[Sun] = 696000.
 
PlanetRadius[Uranus] = 25559.
 
PlanetRadius[Venus] = 6052.
 
PlanetRadius[Vesta] = 288.
 
PlanetRadius[object_] = 0.001
 
Ecliptic /: Ecliptic::trace = ""
 
Ecliptic /: Ecliptic::usage = "Ecliptic is an option to the various StarChart \
commands. By default it is set to True, and it causes the ecliptic line, to \
be drawn on the chart. The Sun, Moon and planets all move approximately along \
the ecliptic line."
 
StarLabels /: StarLabels::trace = ""
 
StarLabels /: StarLabels::usage = "StarLabels is an option to the various \
StarChart commands. By default it is set to False, but if set to True it will \
cause labels for the brightest stars to be drawn on the chart."
 
OrbitTrackPlot[___] := (Message[OrbitTrackPlot::noavail, OrbitTrackPlot]; )
 
Options[OrbitTrackPlot] = {Shading -> False, PlotPoints -> 25}
 
OrbitTrackPlot /: OrbitTrackPlot::noavail = 
     "This is just the demo version, and `1` is not available."
 
OrbitTrackPlot /: OrbitTrackPlot::usage = "OrbitTrackPlot[object, date1, \
date2] returns a 2D graphic showing the track of the object (between date1 \
and date2) as projected onto the Earth's surface. Locations along the track \
are such that the object will be directly overhead at some time between date1 \
and date2. The object should normally be an Earth satellite, but in general \
it can be a planet or anything else. The red regions are when the object will \
be overhead just after dusk in the evening sky. Similarly the blue regions \
are when the object will be overhead just before dawn in the morning sky. If \
the object is a low orbit Earth satellite, then the red and blue regions will \
be the window of opportunity when you might be able to see the satellite for \
perhaps 5 or 10 minutes whilst it is still illuminated by the Sun and your \
viewing location is in darkness. If date2 is omitted the day following date1 \
is used. If date1 is also omitted the current Date[] is used. Use PlotPoints \
to adjust the resolution of the track. The default is PlotPoints->25."
 
SolarSystemPlot[___] := (Message[SolarSystemPlot::noavail, SolarSystemPlot]; )
 
Options[SolarSystemPlot] = {Distance -> 12*AU, ViewPoint -> Earth, 
     Moon -> True}
 
SolarSystemPlot /: SolarSystemPlot::noavail = 
     "This is just the demo version, and `1` is not available."
 
SolarSystemPlot /: SolarSystemPlot::usage = "SolarSystemPlot[date] returns a \
2D graphic showing the general layout of how the Solar System would look on \
the given date. The Earth is the blue dot at the centre, and the Sun is the \
yellow dot. Planets that happen to be near the yellow line (such as Venus and \
Mercury which always are), can only be seen from Earth at dusk or dawn. \
Planets near the red line will be high in the sky when the Sun sets, and \
hence they will be visible only in the evening sky for a time until they set \
in the west. Similarly planets near the blue line will be high in the sky \
when the Sun rises, and hence they will be visible only in the morning sky \
for a time after they rise in the east. For planets nearly 180 degrees away \
from the yellow line, they will be visible all night long. Use the option \
Distance to show a bigger or smaller field of view. For example \
SolarSystemPlot[{1993,11,17}, Distance->3*AU]. The default distance is \
Distance->12*AU which goes out to just past Saturn. The option Moon->False \
can used to suppress the Moon's image on the edge of the graphic. And you can \
use the option ViewPoint->Sun to put the Sun, rather than the default Earth, \
at the centre. When the ViewPoint is not Earth, the morning and evening sky \
lines are suppressed. If date is omitted the current Date[] is used."
 
hour$and$min[Indeterminate] := Indeterminate
 
hour$and$min[ascension_] := 
    Block[{asc, hour, 
      minutes, pmins}, 
     asc = Round[ascension*600.]/600; 
      hour = Floor[asc]; 
      minutes = 
       N[Floor[600*(asc - hour)]/10]; 
      pmins = ToString[
        Round[10*Mod[minutes, 1]]]; 
      minutes = Floor[minutes]; 
      If[hour < 10, hour = 
        StringJoin[" ", ToString[hour]], 
       hour = ToString[hour]]; 
      If[minutes < 10, minutes = 
        StringJoin["0", ToString[minutes]], 
       minutes = ToString[minutes]]; 
      StringJoin[hour, "h", minutes, 
       ".", pmins, "m"]]
 
hour$and$min /: hour$and$min::trace = 
     ""
 
JupiterSystemPlot[___] := (Message[JupiterSystemPlot::noavail, 
      JupiterSystemPlot]; )
 
JupiterSystemPlot /: JupiterSystemPlot::noavail = 
     "This is just the demo version, and `1` is not available."
 
JupiterSystemPlot /: JupiterSystemPlot::usage = "JupiterSystemPlot[date] \
returns a 2D graphic showing the positions of the Galilean Moons around \
Jupiter on the given date. If date is omitted the current Date[] is used."
 
Refract[___] := (Message[Refract::noavail, Refract]; )
 
Refract /: Refract::noavail = 
     "This is just the demo version, and `1` is not available."
 
Refract /: Refract::usage = "Refract[horizoncoords] converts true \
horizoncoords (i.e the horizon coordinates returned by the HorizonCoordinates \
command) into apparent horizon coordinates by adding an atmospheric \
refraction correction. The correction can amount to about 0.5 Degree for \
objects close to the horizon, but is otherwise quite small."
 
Elongation[object_, opts___Rule] := 
    Elongation[object, Date[], opts]
 
Elongation[object_, datum_List, 
     opts___Rule] := 
    Elongation[object, ModifiedJulianDay[
      datum], opts]
 
Elongation[Sun, d:_Real | _Integer, 
     opts___Rule] := 0
 
Elongation[object_, d:
      _Real | _Integer, opts___Rule] := 
    Block[{view, planxyz, 
      viewxyz, tilt, 
      c, s, dx, 
      dy, dz, x1, 
      y1, x2, y2, 
      dd1, dd2}, 
     view = ViewPoint /. {opts} /. 
        Options[Coordinates]; planxyz = 
       GetCoords[object, 
        d]; viewxyz = 
       GetCoords[view, 
        d]; tilt = 
       EarthTilt[d]*N[Degree]; 
      c = Cos[tilt]; 
      s = Sin[tilt]; 
      {dx, dy, 
        dz} = {0, 0, 0} - viewxyz; 
      x1 = dx; 
      y1 = c*dy - 
        s*dz; 
      {dx, dy, 
        dz} = planxyz - 
        viewxyz; x2 = 
       dx; y2 = 
       c*dy - s*
         dz; dd1 = 
       x1^2 + y1^2; 
      If[dd1 <= 0, Return[0]]; dd2 = 
       x2^2 + y2^2; 
      If[dd2 <= 0, Return[0]]; c = 
       (x1*x2 + 
         y1*y2)/
        Sqrt[dd1*dd2]; 
      s = 
       If[x1*y2 - 
          y1*x2 < 0, -1, 1]; 
      If[-1 < c < 1, (s*
          ArcCos[c])/N[Degree], 
        If[c > 0, 0., 180.]]*Degree]
 
Elongation /: Elongation::trace = ""
 
Elongation /: Elongation::usage = "Elongation[object, date] returns the \
Elongation of the object (a planet or a star etc). This measures the angle \
that the object is East of the Sun. A negative angle would mean the object is \
West of the Sun. Objects with positive Elongation are mostly evening visible, \
whereas objects with negative Elongation are mostly morning visible. If date \
is omitted the current Date[] is used."
 
bText[text_, 
     pos___] := Text[FontForm[text, 
      {"Helvetica-Bold", 14}], pos]
 
bText /: bText::trace = ""
 
getSpotP[sun1_, 
     moon1_, sun_] := 
    Block[{u = moon1, 
      v = sun1 - 
        moon1, a, 
      b, c, d}, 
     a = v . v; 
      b = 2*u . 
         v; c = 
       u . u - 6378.387^2; 
      d = b^2 - 
        4*a*c; 
      If[d > 0, d = 
        Sqrt[d], d = 0]; 
      Select[{u + (v*
           (-b + d))/
          (2*a), u + 
         (v*(-b - 
            d))/(2*a)}, 
       #1 . sun > 0 & ]]
 
getSpotP /: getSpotP::trace = ""
 
getSpotU[sun1_, 
     moon1_, sun_] := 
    Block[{u = moon1, 
      v = sun1 - 
        moon1, a, 
      b, c, d}, 
     a = v . v; 
      b = 2*u . 
         v; c = 
       u . u - 6378.387^2; 
      d = b^2 - 
        4*a*c; 
      If[d > 0, d = 
        Sqrt[d], Return[{}]]; 
      Select[{u + (v*
           (-b + d))/
          (2*a), u + 
         (v*(-b - 
            d))/(2*a)}, 
       #1 . sun > 0 & ]]
 
getSpotU /: getSpotU::trace = ""
 
EveningApparition /: EveningApparition::trace = ""
 
EveningApparition /: EveningApparition::usage = "EveningApparition is an \
eventdate output by the BestView command. When an inner planet (i.e Mercury \
or Venus) is at its Greatest Elongation East of the Sun, as viewed from \
Earth, it will be at its highest in the evening sky just after dusk, and this \
is said to be an EveningApparition. The planet will also be furthest from the \
glare of the Sun, and so an EveningApparition eventdate will be the best date \
for viewing a planet in the evening. Before EveningApparition the planet will \
be visible in the evening sky. After EveningApparition it will very quickly \
move towards the Sun to later reappear in the morning sky. (See \
?MorningApparition.) Evening Searches for Mercury can be made at \
EveningApparition eventdates. Searches should start 40 minutes after SunsetP \
and end 70 minutes after SunsetP. The best EveningApparition's to search for \
Mercury are in Spring."
 
JupiterCoordinates[___] := (Message[JupiterCoordinates::noavail, 
      JupiterCoordinates]; )
 
JupiterCoordinates /: JupiterCoordinates::noavail = 
     "This is just the demo version, and `1` is not available."
 
JupiterCoordinates /: JupiterCoordinates::usage = "JupiterCoordinates[moon, \
date] returns the relative {x,y,z} coordinates of a Galilean moon (either Io, \
Europa, Ganymede or Callisto). The numbers are in Jovian radii. The \
coordinate system is aligned so that x is parallel to normal Ascension, and y \
parallel to Declination. The z coordinate is parallel to the Distance vector \
from Earth. Because the Galilean moons are so close to Jupiter one can use \
{x,y,z}*{0.005*Degree, 0.005*Degree, 0.000477326*AU} to get an approximate \
perturbation to add to the equatorcoords of Jupiter in order to determine the \
true equatorcoords of the Galilean moon. If date is omitted the current \
Date[] is used."
 
EclipseQ[___] := (Message[EclipseQ::noavail, EclipseQ]; )
 
EclipseQ /: EclipseQ::noavail = 
     "This is just the demo version, and `1` is not available."
 
EclipseQ /: EclipseQ::usage = "EclipseQ[object1, object2, object3, date] \
returns True if object1 is eclipsed by object2 from the light from object3 on \
the given date. The object3 is treated as a point source, but the diameters \
of object1 and object2 are taken into account. The command effectively tests \
for a *partial* eclipse. If object3 is omitted then the Sun is used. If \
object2 is omitted then the Earth is used (unless object1 is itself the Earth \
in which case the Moon is used). Thus EclipseQ[Mir, date] will return False \
if the object Mir is illuminated by the Sun, i.e not in the Earth's shadow. \
Similarly EclipseQ[Moon, FullMoonP[]] will return True if the next fullmoon is \
a Lunar Eclipse. To test for Solar Eclipses, use EclipseQ[Earth, Moon, Sun, \
NewMoonP[]]. Other examples are: EclipseQ[Io, Jupiter, Sun, date] which tests \
if Io is in Jupiter's shadow; and EclipseQ[Io, Jupiter, Earth, date] which \
tests if Io is hidden from the Earth. Similarly, EclipseQ[Jupiter, Io, Earth, \
date] tests if Io is in transit across the Jovian disk, and EclipseQ[Sun, \
Venus, Earth, date] tests if Venus is in transit across the Solar disk. If \
date is omitted the current Date[] is used."
 
EclipseTrackPlot[___] := (Message[EclipseTrackPlot::noavail, 
      EclipseTrackPlot]; )
 
EclipseTrackPlot /: EclipseTrackPlot::noavail = 
     "This is just the demo version, and `1` is not available."
 
EclipseTrackPlot /: EclipseTrackPlot::usage = "EclipseTrackPlot[neardate] \
returns a 2D graphic of either the Earth or the Moon, depending on whether \
neardate is near a New Moon (for a Solar Eclipse) or a Full Moon (for a Lunar \
Eclipse). For a Solar Eclipse the full track of the umbra and penumbra \
shadows will be displayed on the Earth's surface for the duration of the \
Eclipse. In the graphic, the black line represents the track of Totality. The \
upper and lower red lines represent the edges of the penumbra where a partial \
Eclipse will occur, and the green lines at the ends show where the Eclipse \
will start at SunRiseP or finish at SunSetP. An example usage would be: \
EclipseTrackPlot[SolarEclipseP[{1948,5,9}]];. For a Lunar Eclipse the full \
track of the motion of the Moon will be displayed against the umbra and \
penumbra shadows coming from Earth. An example usage would be: \
EclipseTrackPlot[LunarEclipse[{1993,6,5}]];. EclipseTrackPlot[object1, \
object2, Earth, neardate] can be used to plot the track of umbra/penumbra \
shadows of object2 caused by the light from object1 that will be cast on the \
Earth's surface near the date neardate. For example: EclipseTrackPlot[Spica, \
Moon, Earth, {1995, 1, 23, 11+TimeZone[], 0, 0}]; will show the regions on \
the Earth surface that can see the occultation of the star Spica by the Moon \
near the given date. If neardate is omitted the current Date[] is used."
 
Opposition /: Opposition::trace = ""
 
Opposition /: Opposition::usage = "Opposition is an eventdate output by the \
BestView command. When an outer planet (such as Mars, Jupiter, Saturn etc) is \
in the opposite direction to the Sun, as viewed from Earth, it is said to be \
at Opposition. This is when the outer planet will be closest to the Earth, \
and hence the planet will be at its brightest. Before Opposition the planet \
will be mostly visible in the morning sky. After Opposition it will be mostly \
visible in the evening sky. And during Opposition it will be visible all \
night long. Retrograde motion also occurs around the Opposition eventdate. \
For Mars, retrograde motion lasts 10 weeks, and it goes back 15 Degrees. For \
Jupiter, retrograde motion lasts 16 weeks, and it goes back 10 Degrees. For \
Saturn, retrograde motion lasts 20 weeks, and it goes back 7 Degrees."
 
ZenithStarChart[___] := (Message[ZenithStarChart::noavail, ZenithStarChart]; )
 
ZenithStarChart /: ZenithStarChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
ZenithStarChart /: ZenithStarChart::usage = "ZenithStarChart[date] shows the \
full overhead star field for the given date. The field of view is 100 degrees \
in radial angle, and the horizon is shown as the ring near the outer edge. \
The Zenith is shown in the center. If date is omitted the current Date[] is \
used. Any StarChart option can be used with the ZenithStarChart command. Note \
that this command is essentially the same as: RadialStarChart[Zenith, date, \
RadialAngle->100*Degree, Horizon->True, Planets->{Sun, Moon}]; except that \
the labelling around the edges is different."
 
LunationNumberP[___] := (Message[LunationNumberP::noavail, LunationNumberP]; )
 
LunationNumberP /: LunationNumberP::noavail = 
     "This is just the demo version, and `1` is not available."
 
LunationNumberP /: LunationNumberP::usage = "LunationNumberP[neardate] computes \
the Lunation number n nearest the given neardate. It essentially counts the \
number of New Moons that have occured since 1-Jan-1900. See also ?Lunation. \
If neardate is omitted the current Date[] is used."
 
SetCoordinates[___] := (Message[SetCoordinates::noavail, SetCoordinates]; )
 
SetCoordinates /: SetCoordinates::noavail = 
     "This is just the demo version, and `1` is not available."
 
SetCoordinates /: SetCoordinates::usage = "SetCoordinates[newobject, coords, \
d, ViewPoint->parentbody] defines a new object having xyz coordinates \
(centred around parentbody) as a function of the modified Julian day d. For \
example: SetCoordinates[Voyager2, {0,-0.005*(mjd-30000),0}, mjd, \
ViewPoint->Sun];"
 
magnitude[(star_) . 
      (constell_), distance_, 
     phase_] := Block[{stars}, 
     stars = Cases[TheStars, 
        {constell, star, __}]; 
      If[stars === {}, 1000., 
       Round[10*stars[[1,3]]]/10.]]
 
magnitude[planet_, 
     distance_, phase_] := 
    Block[{r}, If[phase < 1.*^-6, 
       Return[1000.]]; r = distance/
        (MeanDistance[planet]*
         Sqrt[phase]); 
      Round[10*(MeanMagnitude[
           planet] + 5.*Log[10, r])]/
       10.]
 
magnitude /: magnitude::trace = ""
 
MeanDistance[Callisto] = 5.191
 
MeanDistance[Ceres] = 2.751
 
MeanDistance[Earth] = 1.
 
MeanDistance[Europa] = 5.191
 
MeanDistance[Ganymede] = 5.191
 
MeanDistance[Io] = 5.191
 
MeanDistance[Jupiter] = 5.191
 
MeanDistance[Mars] = 1.51
 
MeanDistance[Mercury] = 0.3707
 
MeanDistance[Moon] = 0.0025618207207454115
 
MeanDistance[Neptune] = 30.06
 
MeanDistance[Pallas] = 2.621
 
MeanDistance[Pluto] = 37.22
 
MeanDistance[Saturn] = 9.509
 
MeanDistance[Sun] = 1.
 
MeanDistance[Uranus] = 19.14
 
MeanDistance[Venus] = 0.7233
 
MeanDistance[Vesta] = 2.343
 
MeanDistance[planet_] := 1.
 
MeanDistance /: MeanDistance::trace = 
     ""
 
ChartPosition[___] := (Message[ChartPosition::noavail, ChartPosition]; )
 
ChartPosition /: ChartPosition::noavail = 
     "This is just the demo version, and `1` is not available."
 
ChartPosition /: ChartPosition::usage = "ChartPosition[ascension, \
declination] produces internal coordinates that will eventually be evaluated \
when passed via the Epilog or Prolog option to the commands StarChart, \
RadialStarChart, HorizonStarChart or ZenithStarChart. An example usage is: \
\n\tRadialStarChart[{Ascension->4*Hour, Declination->30*Degree}, \
Epilog->Line[{ \n\tChartPosition[3.6*Hour, 26*Degree], \
\n\tChartPosition[3.9*Hour, 26*Degree], \n\tChartPosition[3.9*Hour, \
22*Degree], \n\tChartPosition[3.6*Hour, 22*Degree], \
\n\tChartPosition[3.6*Hour, 26*Degree] }]]; \n\twhich will box the Pleiades \
cluster. See also ?ChartCoordinates."
 
getRotate[d_] := 
    Block[{r3, c3, 
      s3, R3, r1, 
      c1, s1, R1, 
      rotate}, r3 = 
       (SolarMeanLongitude[d] + 
         360*(d - Round[d]) - 180)*
        N[Degree]; r1 = 
       -(EarthTilt[d]*N[Degree]); 
      c3 = Cos[r3]; 
      s3 = Sin[r3]; 
      c1 = Cos[r1]; 
      s1 = Sin[r1]; 
      R3 = {{c3, 
         -s3, 0}, {s3, 
         c3, 0}, {0, 0, 1}}; R1 = 
       {{1, 0, 0}, {0, c1, -s1}, 
        {0, s1, c1}}; 
      rotate = Inverse[R1 . 
         R3]; rotate]
 
getRotate /: getRotate::trace = ""
 
SetOrbitalElements[___] := (Message[SetOrbitalElements::noavail, 
      SetOrbitalElements]; )
 
Options[SetOrbitalElements] = {ViewPoint -> Sun, Date :> Date[], 
     OrbitalMeanMotion -> Revs/OrbitalPeriod, OrbitalDecayRate -> 0., 
     OrbitalSemiMajorAxis -> 0.01957070708640316*AU*Abs[OrbitalPeriod/Day]^
        (2/3), OrbitalEccentricity -> 0., OrbitalInclination -> 0., 
     OrbitalPeriod -> 365.25*Day, MeanAnomaly -> 0., PerigeeArgument -> 0., 
     AscendingLongitude -> 0., MeanLongitude -> AscendingLongitude + 
       MeanAnomaly + PerigeeArgument, PerigeeLongitude -> 
      AscendingLongitude + PerigeeArgument}
 
SetOrbitalElements /: SetOrbitalElements::noavail = 
     "This is just the demo version, and `1` is not available."
 
SetOrbitalElements /: SetOrbitalElements::usage = "SetOrbitalElements[newobje\
ct, ViewPoint->parentbody, Date->date, elements...] defines a new object with \
the given orbital elements (for the date) around the parent body. The orbital \
elements are: {OrbitalMeanMotion (in Revs/Day), OrbitalDecayRate (in \
Revs/Day^2)}, {OrbitalSemiMajorAxis (in AU's), OrbitalEccentricity, \
OrbitalInclination}, {MeanAnomaly, PerigeeArgument, AscendingLongitude}. Note \
that OrbitalPeriod == 1/OrbitalMeanMotion, and MeanLongitude == MeanAnomaly + \
PerigeeLongitude, and PerigeeLongitude == PerigeeArgument + \
AscendingLongitude. The TwoLineElements command can be used in conjunction \
with the SetOrbitalElements command. And to make this easier you can use \
SetOrbitalElements[newobject, line1, line2] where line1 and line2 are the \
lines in the standard NORAD Two-Line Orbital Element format."
 
OrbitalMeanMotion /: OrbitalMeanMotion::usage = "OrbitalMeanMotion is an \
option to SetOrbitalElements. It's unit is Revs/Day."
 
OrbitalPeriod /: OrbitalPeriod::usage = 
     "OrbitalPeriod is an option to SetOrbitalElements. It's unit is Day."
 
OrbitalDecayRate /: OrbitalDecayRate::usage = "OrbitalDecayRate is an option \
to SetOrbitalElements. It's unit is Revs/Day^2."
 
OrbitalSemiMajorAxis /: OrbitalSemiMajorAxis::usage = "OrbitalSemiMajorAxis \
is an option to SetOrbitalElements. It's unit is usually AU's, but you can \
use KiloMeter's as well."
 
Day /: Day::trace = ""
 
Day /: Day::usage = "Day is the basic time unit. It equals 86400seconds."
 
OrbitalEccentricity /: OrbitalEccentricity::usage = 
     "OrbitalEccentricity is an option to SetOrbitalElements."
 
OrbitalInclination /: OrbitalInclination::usage = 
     "OrbitalInclination is an option to SetOrbitalElements."
 
MeanAnomaly /: MeanAnomaly::usage = 
     "MeanAnomaly is an option to SetOrbitalElements."
 
PerigeeArgument /: PerigeeArgument::usage = 
     "PerigeeArgument is an option to SetOrbitalElements."
 
AscendingLongitude /: AscendingLongitude::usage = 
     "AscendingLongitude is an option to SetOrbitalElements."
 
MeanLongitude /: MeanLongitude::usage = 
     "MeanLongitude is an option to SetOrbitalElements."
 
PerigeeLongitude /: PerigeeLongitude::usage = 
     "PerigeeLongitude is an option to SetOrbitalElements."
 
PlanetPlot[___] := (Message[PlanetPlot::noavail, PlanetPlot]; )
 
Options[PlanetPlot] = {Shading -> True, FeatureLabels -> False}
 
PlanetPlot /: PlanetPlot::noavail = 
     "This is just the demo version, and `1` is not available."
 
PlanetPlot /: PlanetPlot::usage = "PlanetPlot[planet, date] returns a 2D \
graphic showing how the planet would look on the given date. If the planet is \
the Earth, then during a Solar Eclipse the umbra and penumbra shadows will be \
shown. If date is omitted the current Date[] is used."
 
FeatureLabels /: FeatureLabels::trace = ""
 
FeatureLabels /: FeatureLabels::usage = "FeatureLabels is an option to \
PlanetPlot and PlanetPlot3D. By default it is set to False, but if set to \
True it will cause geographic features to be labelled on the plot."
 
Constellations /: Constellations::trace = ""
 
Constellations /: Constellations::usage = "Constellations is an option to the \
various StarChart commands. By default it is set to True, and it causes \
constellation outlines to be drawn on the chart."
 
ConstellationLabels /: ConstellationLabels::trace = ""
 
ConstellationLabels /: ConstellationLabels::usage = "ConstellationLabels is \
an option to the various StarChart commands. By default it is set to False, \
but if set to True it will cause the constellation labels to be drawn on the \
chart."
 
SunRiseP[] := SunRiseP[Date[]]
 
SunRiseP[datum_List] := 
    SunRiseP[ModifiedJulianDay[datum]]
 
SunRiseP[d:_Real | _Integer] := 
    Block[{md, h, 
      et, rise}, 
     md = Floor[d + 
          GMT$diff/24. + 0.00001] - 
        Geo$Longitude/360; rise = 
       md + 0.25; {h, 
        et} = gethet[
        rise]; rise = 
       md + et + 
        h/24; LocalDate[rise]]
 
SunRiseP /: SunRiseP::trace = ""
 
SunRiseP /: SunRiseP::usage = "SunRiseP[neardate] computes the precise time of \
the Sun rise on the day of the given neardate. If neardate is omitted the \
current Date[] is used."
 
LocalDate[] := Date[]
 
LocalDate[datum:{_Integer | _Real, _Integer | _Real, 
       _Integer | _Real, _Integer | _Real, _Integer | _Real, 
       _Integer | _Real}] := datum
 
LocalDate[{y:_Integer | _Real, m:
       _Integer | _Real, d:_Integer | _Real}] := 
    {y, m, d, 0, 
     0, 0}
 
LocalDate[day:_Real | _Integer] := 
    ToDate[Round[day*86400 + 
       Epoch$1900]]
 
LocalDate /: LocalDate::trace = ""
 
LocalDate /: LocalDate::usage = "LocalDate[mjd] returns the local date \
corresponding to the modified Julian day number mjd. Essentially this is the \
inverse of the ModifiedJulianDay[date] command."
 
gText[text_, 
     pos___] := Text[FontForm[text, 
      {"Helvetica", 12}], pos]
 
gText /: gText::trace = ""
 
normsto[{0, 0, v3_}] := 
    {{1, 0, 0}, {0, 1, 0}}
 
normsto[{v1_, 
      v2_, v3_}] := 
    Block[{na, nb}, 
     na = {-v2, 
        v1, 0}; na /= 
       Sqrt[na . na]; 
      nb = {-(v1*
          v3), -(v2*
          v3), v1^2 + 
         v2^2}; nb /= 
       Sqrt[nb . nb]; 
      {na, nb}]
 
normsto /: normsto::trace = ""
 
Precession /: Precession::trace = ""
 
Precession /: Precession::usage = "Precession is the slow rotation of the \
Earth's axis due to the tidal pull of the Sun and Moon. It takes 25,760 years \
to complete one revolution, and thus it causes the Equinox to shift 50 \
arc-minutes westward every year."
 
Planisphere[___] := (Message[Planisphere::noavail, Planisphere]; )
 
Planisphere /: Planisphere::noavail = 
     "This is just the demo version, and `1` is not available."
 
Planisphere /: Planisphere::usage = "Planisphere[] produces the two plates \
needed to construct a planisphere for your GeoLatitude. A planisphere is a \
clever device for determining which stars will be above the local horizon at \
any given hour for each day of the year. The second plate should be \
photocopied onto a transparency and rivetted at the centre of the first \
plate. Both plates should then be trimmed to a circle to construct a working \
planisphere. Planisphere[GeoLatitude -> latitude] can be used to set a \
GeoLatitude other than the one set using SetLocation. Any StarChart option \
can be used with the Planisphere command. The default MagnitudeRange is set \
to MagnitudeRange -> {-Infinity, 3.5} in order to stop the star plate \
becoming too cluttered."
 
GMTstyle[zone_] := 
    StringJoin[If[zone < 0, "GMT-", "GMT+"], 
     ToString[PaddedForm[Abs[zone], 2, 
       NumberSigns -> {"", ""}, NumberPadding -> " "]]]
 
GMTstyle /: GMTstyle::trace = ""
 
dateform[{year_, 
      month_, day_, 
      hour_, minute_, 
      second_}] := Block[{MONTHS}, 
     MONTHS = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}; 
      ToString[StringForm["`1`-`2`-`3` `4`:`5`:`6`", 
        twodigits[day], 
        MONTHS[[month]], 
        year, twodigits[
         hour], twodigits[
         minute], twodigits[
         second]]]]
 
dateform[day_] := 
    dateform[LocalDate[day]]
 
dateform /: dateform::trace = ""
 
twodigits[n_] := 
    PaddedForm[n, 2, NumberSigns -> {"", ""}, 
     NumberPadding -> "0"]
 
twodigits /: twodigits::trace = ""
 
HaDecToAzAlt[{ha_, 
      dec_}] := 
    Block[{x = N[ha*15*Degree], 
      y = N[dec*Degree], 
      sx, cx, sy, 
      cy, az, 
      alt}, sx = 
       Sin[x]; cx = 
       Cos[x]; sy = 
       Sin[y]; cy = 
       Cos[y]; alt = 
       ArcSin[sy*Sin$Geo$Latitude + 
         cy*cx*
          Cos$Geo$Latitude]; alt = 
       N[alt/Degree]; 
      If[Chop[Abs[alt] - 90] === 0, 
       az = 0., az = 
         ArcTan[-(cy*cx*
             Sin$Geo$Latitude) + sy*
            Cos$Geo$Latitude, cy*
           sx]; az = 
         Mod[az/N[Degree], 360]]; 
      {az, alt}]
 
HaDecToAzAlt /: HaDecToAzAlt::trace = 
     ""
 
ggg[c_] := 
    (c::noavail = 
      "This is just the demo version, and `1` is not available."; 
     c[___] := (Message[c::noavail, 
        c]; ))
 
StarColors /: StarColors::trace = ""
 
StarColors /: StarColors::usage = "StarColors is an option to the various \
StarChart commands. By default it is set to False, but if set to True it will \
cause the spectral colors of stars to be drawn on the chart."
 
EclipticChart[___] := (Message[EclipticChart::noavail, EclipticChart]; )
 
EclipticChart /: EclipticChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
EclipticChart /: EclipticChart::usage = 
     "EclipticChart[] returns a graphic showing the stars along the \
Ecliptic."
 
date2form[{year_, 
      month_, day_, 
      hour_, minute_, 
      second_}] := Block[{MONTHS}, 
     MONTHS = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}; 
      StringJoin[If[day < 10, " ", ""], 
       ToString[day], " ", MONTHS[[
        month]]]]
 
date2form[day_] := 
    date2form[LocalDate[day]]
 
date2form /: date2form::trace = ""
 
SolarEclipseP[___] := (Message[SolarEclipse::noavail, SolarEclipse]; )
 
SolarEclipseP /: SolarEclipseP::noavail = 
     "This is just the demo version, and `1` is not available."
 
SolarEclipseP /: SolarEclipseP::usage = "SolarEclipse[neardate] computes the \
precise time of the next Solar Eclipse after the given neardate. A Total \
Solar Eclipse is visible only from a small spot on Earth, where it can last \
up to 7.6 minutes. If neardate is omitted the current Date[] is used."
 
Planets /: Planets::trace = ""
 
Planets /: Planets::usage = "Planets is an option to the various StarChart \
commands. By default it is set to None, but it can be set to a list of planet \
names, or simply to All. This option allows planet dots to be displayed in \
the output."
 
RiseSetChart[___] := (Message[RiseSetChart::noavail, RiseSetChart]; )
 
Options[RiseSetChart] = {DaylightSaving -> None}
 
RiseSetChart /: RiseSetChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
RiseSetChart /: RiseSetChart::usage = "RiseSetChart[object, year] returns a \
graphic showing the local Rising and Setting times for the object (a planet \
or a star) during the course of the year. The gray areas represent night-time \
and the green areas show when the object will be visible above the horizon \
during the night. Meridian Transits occur on the cyan line. The red line is \
the local Rising time, and the blue line is the local Setting time. These \
local times depend on your GeoLatitude and this can be changed using the \
SetLocation command, or more simply it can be passed as an option to \
RiseSetChart. A DaylightSaving option is also available. The option \
DaylightSaving -> Automatic, causes clocks to be shifted one hour back for \
the four months over summer. The summer months in the vertical axis are \
highlighted when DaylightSaving is in effect, and a separate horizontal hour \
axis (shifted one hour to the left) is given at the bottom. If year is \
omitted the current year is used."
 
Ecliptic$Coordinates[{dx_, 
      dy_, dz_}, 
     day_] := Block[{dr, 
      latitude, longitude, 
      distance}, dr = 
       Sqrt[dx^2 + dy^2]; 
      distance = Sqrt[dr^2 + 
         dz^2]; longitude = 
       ArcTan[dx, dy]/N[Degree]; 
      latitude = ArcTan[dr, 
         dz]/N[Degree]; 
      If[longitude < 0, longitude += 
        360]; {longitude*Degree, 
       latitude*Degree, distance*AU}]
 
Ecliptic$Coordinates /: 
    Ecliptic$Coordinates::trace = ""
 
SunSetP[] := SunSetP[Date[]]
 
SunSetP[datum_List] := 
    SunSetP[ModifiedJulianDay[datum]]
 
SunSetP[d:_Real | _Integer] := 
    Block[{md, h, 
      et, set}, 
     md = Floor[d + 
          GMT$diff/24. + 0.00001] - 
        Geo$Longitude/360; set = 
       md + 0.75; {h, 
        et} = gethet[
        set]; set = 
       md + et + 
        (1 - h/24); LocalDate[set]]
 
SunSetP /: SunSetP::trace = ""
 
SunSetP /: SunSetP::usage = "SunSetP[neardate] computes the precise time of the \
Sun set on the day of the given neardate. If neardate is omitted the current \
Date[] is used."
 
RadialAngle /: RadialAngle::trace = ""
 
RadialAngle /: RadialAngle::usage = "RadialAngle is an option to the various \
StarChart commands which specifies the angular size of the field of view to \
use."
 
PlanetPlot3D[___] := (Message[PlanetPlot3D::noavail, PlanetPlot3D]; )
 
Options[PlanetPlot3D] = {Shading -> True, FeatureLabels -> False, 
     ViewPoint -> Automatic}
 
PlanetPlot3D /: PlanetPlot3D::noavail = 
     "This is just the demo version, and `1` is not available."
 
PlanetPlot3D /: PlanetPlot3D::usage = "PlanetPlot3D[planet, date] returns a \
3D graphic showing how the planet would look on the given date. The default \
ViewPoint is the Earth, unless the planet itself is the Earth, in which case \
the ViewPoint is the Sun. If the planet is the Earth, then during a Solar \
Eclipse the umbra and penumbra shadows will be shown. Similarly if the planet \
is the Moon, then during a Lunar Eclipse the umbra and penumbra shadows will \
be shown. And if the planet is the Sun, then during a Solar Eclipse the Moon \
will be shown; and transits of Mercury and Venus across the Solar disk will \
also be shown should they occur. If the planet is Jupiter, then the Great Red \
Spot, the three lesser known White Spots, and also the four Galilean \
satellites are all correctly displayed according to their positions for the \
date. Similarly if the planet is Saturn, then the orientation of the Rings \
are correctly displayed. If date is omitted the current Date[] is used."
 
Galaxies /: Galaxies::trace = ""
 
Galaxies /: Galaxies::usage = "Galaxies is an option to the various StarChart \
commands. By default it is set to False, but if set to True it will cause \
Galaxies to be drawn on the chart."
 
VenusChart[___] := (Message[VenusChart::noavail, VenusChart]; )
 
VenusChart /: VenusChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
VenusChart /: VenusChart::usage = "VenusChart[baseyear] returns a graphic \
showing the elongation of Venus month by month for the next 8 years after the \
baseyear. Venus is in a near perfect orbital resonance with Earth, with the \
result that the graphic approximately repeats after 8 years. Elongations to \
the left are such that Venus rises before the Sun, and hence it will be \
visible in the morning hours just before dawn. Similarly elongations to the \
right are such that Venus sets after the Sun, and hence it will be visible in \
the evening hours just after dusk. The phase and magnitude of Venus is \
indicated with the icons scattered around the rim of the graphic. If baseyear \
is omitted the current year is used."
 
Stars250 = {{Andromeda, Beta, 2.06, 17.43, 35.62, "M0"}, 
     {Andromeda, Alpha, 2.07, 2.1, 29.08, "B8"}, {Andromeda, Gamma1, 2.1, 
      30.97, 42.33, "K3"}, {Andromeda, Delta, 3.25, 9.83, 30.87, "K3"}, 
     {Aquarius, Beta, 2.88, 322.89, -5.58, "G0"}, {Aquarius, Alpha, 2.93, 
      331.45, -0.32, "G2"}, {Aquarius, Delta, 3.27, 343.66, -15.82, "A3"}, 
     {Aquila, Alpha, 0.77, 297.7, 8.87, "A7"}, {Aquila, Gamma, 2.72, 296.56, 
      10.62, "K3"}, {Aquila, Zeta, 2.99, 286.35, 13.87, "A0"}, 
     {Aquila, Theta, 3.24, 302.82, -0.82, "B9"}, {Aquila, Delta, 3.36, 
      291.37, 3.12, "F3"}, {Aquila, Lambda, 3.43, 286.56, -4.88, "B9"}, 
     {Ara, Beta, 2.84, 261.32, -55.53, "K3"}, {Ara, Alpha, 2.94, 262.96, 
      -49.88, "B2"}, {Ara, Zeta, 3.12, 254.66, -55.98, "K3"}, 
     {Ara, Gamma, 3.32, 261.35, -56.38, "B1"}, {Aries, Alpha, 2.01, 31.79, 
      23.45, "K2"}, {Aries, Beta, 2.63, 28.66, 20.8, "A5"}, 
     {Auriga, Alpha, 0.08, 79.17, 46., "G5"}, {Auriga, Beta, 1.9, 89.88, 
      44.95, "A2"}, {Auriga, Theta, 2.66, 89.93, 37.2, "A0"}, 
     {Auriga, Iota, 2.69, 74.25, 33.15, "K3"}, {Auriga, Epsilon, 2.98, 75.49, 
      43.83, "F0"}, {Auriga, Eta, 3.17, 76.63, 41.23, "B3"}, 
     {Bootes, Alpha, -0.01, 213.92, 19.18, "K1"}, {Bootes, Epsilon, 2.4, 
      221.25, 27.08, "K0"}, {Bootes, Eta, 2.68, 208.67, 18.4, "G0"}, 
     {Bootes, Gamma, 3.04, 218.02, 38.32, "A7"}, {Bootes, Delta, 3.48, 
      228.88, 33.32, "G8"}, {Bootes, Beta, 3.49, 225.49, 40.38, "G8"}, 
     {Bootes, Rho, 3.57, 217.96, 30.38, "K3"}, {Cancer, Beta, 3.52, 124.13, 
      9.18, "K4"}, {CanesVenatici, Alpha2, 2.88, 194.01, 38.32, "A0"}, 
     {CanisMajor, Alpha, -1.46, 101.29, -16.72, "A1"}, 
     {CanisMajor, Epsilon, 1.5, 104.66, -28.97, "B2"}, 
     {CanisMajor, Delta, 1.84, 107.1, -26.4, "F8"}, 
     {CanisMajor, Beta, 1.98, 95.67, -17.95, "B1"}, 
     {CanisMajor, Eta, 2.44, 111.02, -29.3, "B5"}, {CanisMajor, Zeta, 3.02, 
      95.08, -30.07, "B2"}, {CanisMajor, Omicron2, 3.03, 105.76, -23.83, 
      "B3"}, {CanisMajor, Sigma, 3.47, 105.43, -27.93, "K7"}, 
     {CanisMinor, Alpha, 0.38, 114.83, 5.23, "F5"}, 
     {CanisMinor, Beta, 2.89, 111.79, 8.28, "B8"}, {Capricornus, Delta, 2.83, 
      326.76, -16.13, "A0"}, {Capricornus, Beta, 3.07, 305.25, -14.78, "F8"}, 
     {Carina, Alpha, -0.72, 95.99, -52.68, "F0"}, {Carina, Beta, 1.68, 138.3, 
      -69.72, "A2"}, {Carina, Epsilon, 1.88, 125.63, -59.5, "K3"}, 
     {Carina, Iota, 2.25, 139.28, -59.27, "A8"}, {Carina, Theta, 2.76, 
      160.74, -64.38, "B0"}, {Carina, Upsilon, 2.96, 146.78, -65.07, "A8"}, 
     {Carina, Omega, 3.31, 153.44, -70.03, "B8"}, {Carina, Rho, 3.32, 158., 
      -61.68, "B4"}, {Carina, W, 3.4, 154.27, -61.33, "K3"}, 
     {Carina, A, 3.44, 137.74, -58.97, "B2"}, {Carina, Chi, 3.46, 119.2, 
      -52.98, "B3"}, {Cassiopeia, Alpha, 2.22, 10.13, 56.53, "K0"}, 
     {Cassiopeia, Beta, 2.27, 2.29, 59.15, "F2"}, {Cassiopeia, Gamma, 2.57, 
      14.18, 60.72, "B0"}, {Cassiopeia, Delta, 2.68, 21.45, 60.23, "A5"}, 
     {Cassiopeia, Epsilon, 3.37, 28.6, 63.68, "B3"}, 
     {Cassiopeia, Eta, 3.44, 12.28, 57.82, "G0"}, {Centaurus, Alpha, -0.29, 
      219.9, -60.83, "G2"}, {Centaurus, Beta, 0.61, 210.96, -60.37, "B1"}, 
     {Centaurus, Theta, 2.07, 211.67, -36.38, "K0"}, 
     {Centaurus, Gamma, 2.16, 190.38, -48.97, "A1"}, 
     {Centaurus, Epsilon, 2.3, 204.97, -53.47, "B1"}, 
     {Centaurus, Eta, 2.32, 218.88, -42.15, "B1"}, {Centaurus, Zeta, 2.54, 
      208.88, -47.3, "B2"}, {Centaurus, Delta, 2.58, 182.09, -50.72, "B2"}, 
     {Centaurus, Iota, 2.75, 200.15, -36.72, "A2"}, 
     {Centaurus, Mu, 3.04, 207.4, -42.47, "B2"}, {Centaurus, Kappa, 3.13, 
      224.79, -42.1, "B2"}, {Centaurus, Lambda, 3.13, 173.95, -63.02, "B9"}, 
     {Centaurus, Nu, 3.41, 207.38, -41.68, "B2"}, {Cepheus, Alpha, 2.44, 
      319.65, 62.58, "A7"}, {Cepheus, Beta, 3.18, 322.16, 70.55, "B1"}, 
     {Cepheus, Gamma, 3.22, 354.83, 77.62, "K1"}, {Cepheus, Zeta, 3.35, 
      332.71, 58.2, "K1"}, {Cepheus, Eta, 3.43, 311.32, 61.83, "K0"}, 
     {Cetus, Omicron, 2., 34.84, -2.98, "M7"}, {Cetus, Beta, 2.03, 10.9, 
      -17.98, "K0"}, {Cetus, Alpha, 2.52, 45.57, 4.1, "M1"}, 
     {Cetus, Eta, 3.44, 17.15, -10.18, "K1"}, {Cetus, Gamma, 3.46, 40.82, 
      3.23, "A3"}, {Cetus, Tau, 3.5, 26.02, -15.93, "G8"}, 
     {Cetus, Iota, 3.54, 4.86, -8.83, "K1"}, {Cetus, Theta, 3.6, 21., -8.18, 
      "K0"}, {Cetus, Zeta, 3.72, 27.86, -10.33, "K0"}, 
     {Circinus, Alpha, 3.18, 220.62, -64.97, "A0"}, 
     {Columba, Alpha, 2.63, 84.91, -34.08, "B7"}, {Columba, Beta, 3.11, 
      87.74, -35.77, "K2"}, {CoronaBorealis, Alpha, 2.23, 233.67, 26.72, 
      "A0"}, {Corvus, Gamma, 2.59, 183.95, -17.53, "B8"}, 
     {Corvus, Beta, 2.67, 188.6, -23.4, "G5"}, {Corvus, Delta, 2.95, 187.46, 
      -16.52, "B9"}, {Corvus, Epsilon, 2.99, 182.53, -22.62, "K2"}, 
     {Crux, Alpha, 0.83, 186.65, -63.1, "B0"}, {Crux, Beta, 1.25, 191.93, 
      -59.7, "B0"}, {Crux, Gamma, 1.63, 187.79, -57.12, "M3"}, 
     {Crux, Alpha2, 2.09, 186.65, -63.1, "B1"}, {Crux, Delta, 2.81, 183.79, 
      -58.75, "B2"}, {Cygnus, Alpha, 1.25, 310.36, 45.27, "A2"}, 
     {Cygnus, Gamma, 2.21, 305.55, 40.25, "F8"}, {Cygnus, Epsilon, 2.46, 
      311.55, 33.97, "K0"}, {Cygnus, Delta, 2.87, 296.24, 45.13, "B9"}, 
     {Cygnus, Beta, 3.08, 292.68, 27.97, "K3"}, {Cygnus, Zeta, 3.19, 318.23, 
      30.23, "G8"}, {Dorado, Alpha, 3.26, 68.5, -55.05, "A0"}, 
     {Draco, Gamma, 2.23, 269.15, 51.48, "K5"}, {Draco, Eta, 2.73, 246., 
      61.5, "G8"}, {Draco, Beta, 2.79, 262.61, 52.32, "G2"}, 
     {Draco, Delta, 3.07, 288.14, 67.67, "G9"}, {Draco, Zeta, 3.18, 257.2, 
      65.72, "B6"}, {Draco, Iota, 3.3, 231.23, 58.97, "K2"}, 
     {Eridanus, Alpha, 0.46, 24.43, -57.25, "B3"}, {Eridanus, Beta, 2.77, 
      76.96, -5.08, "A3"}, {Eridanus, Gamma, 2.95, 59.51, -13.52, "M0"}, 
     {Eridanus, Theta1, 3.42, 44.57, -40.3, "A4"}, {Gemini, Beta, 1.14, 
      116.33, 28.02, "K0"}, {Gemini, Alpha, 1.59, 113.65, 31.88, "A1"}, 
     {Gemini, Gamma, 1.93, 99.43, 16.4, "A0"}, {Gemini, Mu, 2.89, 95.74, 
      22.52, "M3"}, {Gemini, Epsilon, 2.99, 100.98, 25.13, "G8"}, 
     {Gemini, Eta, 3.2, 93.72, 22.5, "M3"}, {Gemini, Xi, 3.35, 101.33, 12.9, 
      "F5"}, {Gemini, Delta, 3.53, 110.03, 21.98, "F2"}, 
     {Gemini, Kappa, 3.56, 116.11, 24.4, "G8"}, {Gemini, Lambda, 3.57, 
      109.53, 16.53, "A3"}, {Gemini, Theta, 3.6, 103.2, 33.97, "A3"}, 
     {Grus, Alpha, 1.74, 332.06, -46.97, "B7"}, {Grus, Beta, 2.1, 340.67, 
      -46.88, "M5"}, {Grus, Gamma, 3., 328.48, -37.37, "B8"}, 
     {Grus, Epsilon, 3.49, 342.14, -51.32, "A3"}, {Hercules, Beta, 2.78, 
      247.55, 21.48, "G7"}, {Hercules, Zeta, 2.81, 250.32, 31.6, "G0"}, 
     {Hercules, Delta, 3.14, 258.76, 24.83, "A3"}, {Hercules, Pi, 3.16, 
      258.76, 36.8, "K3"}, {Hercules, Mu, 3.41, 266.62, 27.73, "G5"}, 
     {Hercules, Alpha1, 3.5, 258.66, 14.38, "M5"}, {Hercules, Eta, 3.53, 
      250.73, 38.93, "G8"}, {Hercules, Epsilon, 3.91, 255.07, 30.92, "A0"}, 
     {Hydra, Alpha, 1.98, 141.9, -8.67, "K3"}, {Hydra, Gamma, 2.98, 199.73, 
      -23.18, "G8"}, {Hydra, Nu, 3.11, 162.4, -16.18, "K2"}, 
     {Hydra, Zeta, 3.11, 133.85, 5.95, "G9"}, {Hydra, Pi, 3.26, 211.6, 
      -26.68, "K2"}, {Hydra, Epsilon, 3.37, 131.7, 6.42, "G5"}, 
     {Hydra, Xi, 3.54, 173.25, -31.85, "G7"}, {Hydrus, Beta, 2.8, 6.44, 
      -77.25, "G2"}, {Hydrus, Alpha, 2.86, 29.69, -61.57, "F0"}, 
     {Hydrus, Gamma, 3.27, 56.81, -74.25, "M2"}, {Indus, Alpha, 3.11, 309.39, 
      -47.28, "K0"}, {Leo, Alpha, 1.35, 152.09, 11.97, "B7"}, 
     {Leo, Gamma1, 1.9, 155., 19.85, "K1"}, {Leo, Beta, 2.13, 177.27, 14.57, 
      "A3"}, {Leo, Delta, 2.56, 168.53, 20.52, "A4"}, 
     {Leo, Epsilon, 2.97, 146.46, 23.77, "G1"}, {Leo, Theta, 3.34, 168.56, 
      15.43, "A2"}, {Leo, Zeta, 3.43, 154.17, 23.42, "F0"}, 
     {Leo, Eta, 3.53, 151.83, 16.77, "A0"}, {Leo, Iota, 3.95, 170.98, 10.53, 
      "F4"}, {Lepus, Alpha, 2.58, 83.18, -17.83, "F0"}, 
     {Lepus, Beta, 2.84, 82.06, -20.75, "G5"}, {Lepus, Epsilon, 3.19, 76.37, 
      -22.37, "K5"}, {Lepus, Mu, 3.32, 78.23, -16.2, "B9"}, 
     {Libra, Beta, 2.61, 229.25, -9.38, "B8"}, {Libra, Alpha2, 2.75, 222.72, 
      -16.05, "A3"}, {Libra, Sigma, 3.32, 226.02, -25.28, "M3"}, 
     {Libra, Upsilon, 3.58, 234.25, -28.13, "K3"}, 
     {Libra, Gamma, 3.9, 233.88, -14.78, "G8"}, {Lupus, Alpha, 2.31, 220.48, 
      -47.4, "B1"}, {Lupus, Beta, 2.67, 224.63, -43.13, "B2"}, 
     {Lupus, Gamma, 2.77, 233.79, -41.17, "B2"}, {Lupus, Delta, 3.21, 230.34, 
      -40.65, "B1"}, {Lupus, Epsilon, 3.36, 230.67, -44.7, "B2"}, 
     {Lupus, Eta, 3.4, 240.03, -38.4, "B2"}, {Lupus, Zeta, 3.4, 228.07, 
      -52.1, "G8"}, {Lynx, Alpha, 3.14, 140.26, 34.4, "K7"}, 
     {Lyra, Alpha, 0.03, 279.23, 38.78, "A0"}, {Lyra, Gamma, 3.25, 284.73, 
      32.68, "B9"}, {Lyra, Beta, 3.45, 282.52, 33.37, "B7"}, 
     {Musca, Alpha, 2.7, 189.3, -69.13, "B2"}, {Musca, Beta, 3.05, 191.57, 
      -68.12, "B2"}, {Ophiuchus, Alpha, 2.07, 263.73, 12.57, "A5"}, 
     {Ophiuchus, Eta, 2.43, 257.6, -15.72, "A2"}, {Ophiuchus, Zeta, 2.57, 
      249.29, -10.57, "O9"}, {Ophiuchus, Delta, 2.73, 243.58, -3.68, "M0"}, 
     {Ophiuchus, Beta, 2.77, 265.87, 4.57, "K2"}, {Ophiuchus, Kappa, 3.2, 
      254.43, 9.38, "K2"}, {Ophiuchus, Epsilon, 3.23, 244.58, -4.7, "G9"}, 
     {Ophiuchus, Theta, 3.28, 260.5, -25., "B2"}, {Ophiuchus, Nu, 3.34, 
      269.75, -9.78, "K0"}, {Orion, Beta, 0.12, 78.63, -8.2, "B8"}, 
     {Orion, Alpha, 0.5, 88.79, 7.4, "M1"}, {Orion, Gamma, 1.64, 81.28, 6.35, 
      "B2"}, {Orion, Epsilon, 1.69, 84.05, -1.2, "B0"}, 
     {Orion, Zeta, 2.05, 85.19, -1.95, "O9"}, {Orion, Kappa, 2.06, 86.94, 
      -9.67, "B0"}, {Orion, Delta, 2.2, 83., -0.3, "B0"}, 
     {Orion, Iota, 2.76, 83.86, -5.92, "O9"}, {Orion, Pi3, 3.19, 72.46, 6.95, 
      "F6"}, {Orion, Eta, 3.35, 81.12, -2.38, "B1"}, 
     {Pavo, Alpha, 1.92, 306.41, -56.73, "B2"}, {Pavo, Beta, 3.42, 311.24, 
      -66.2, "A7"}, {Pegasus, 0, 2.07, 2.1, 29.08, "B8"}, 
     {Pegasus, Epsilon, 2.4, 326.05, 9.88, "K2"}, {Pegasus, Alpha, 2.5, 
      346.19, 15.2, "B9"}, {Pegasus, Beta, 2.56, 345.95, 28.08, "M2"}, 
     {Pegasus, Gamma, 2.83, 3.31, 15.18, "B2"}, {Pegasus, Eta, 2.95, 340.75, 
      30.22, "G2"}, {Pegasus, Zeta, 3.39, 340.36, 10.83, "B8"}, 
     {Pegasus, Mu, 3.48, 342.5, 24.6, "G8"}, {Pegasus, Theta, 3.51, 332.55, 
      6.2, "A2"}, {Perseus, Alpha, 1.8, 51.08, 49.85, "F5"}, 
     {Perseus, Beta, 2.15, 47.05, 40.95, "B8"}, {Perseus, Zeta, 2.85, 58.53, 
      31.88, "B1"}, {Perseus, Epsilon, 2.89, 59.46, 40.02, "B0"}, 
     {Perseus, Gamma, 2.94, 46.2, 53.5, "G8"}, {Perseus, Delta, 3.02, 55.73, 
      47.78, "B5"}, {Perseus, Rho, 3.39, 46.29, 38.83, "M4"}, 
     {Phoenix, Alpha, 2.39, 6.57, -42.3, "K0"}, {Phoenix, Beta, 3.3, 16.52, 
      -46.72, "G8"}, {Phoenix, Gamma, 3.41, 22.09, -43.32, "M0"}, 
     {Pictor, Alpha, 3.26, 102.05, -61.93, "A7"}, {PiscisAustrinus, Alpha, 
      1.16, 344.41, -29.62, "A3"}, {Puppis, Zeta, 2.25, 120.9, -40., "O5"}, 
     {Puppis, Pi, 2.7, 109.29, -37.1, "K3"}, {Puppis, Rho, 2.81, 121.89, 
      -24.3, "F6"}, {Puppis, Tau, 2.92, 102.48, -50.62, "K1"}, 
     {Puppis, Nu, 3.17, 99.44, -43.18, "B8"}, {Puppis, Sigma, 3.24, 112.31, 
      -43.3, "K5"}, {Puppis, Xi, 3.35, 117.32, -24.87, "G3"}, 
     {Reticulum, Alpha, 3.34, 63.6, -62.47, "G8"}, {Sagitta, Gamma, 3.47, 
      299.69, 19.5, "M0"}, {Sagittarius, Epsilon, 1.83, 276.04, -34.38, 
      "B9"}, {Sagittarius, Sigma, 2.06, 283.82, -26.3, "B2"}, 
     {Sagittarius, Zeta, 2.6, 285.65, -29.87, "A2"}, 
     {Sagittarius, Delta, 2.69, 275.25, -29.82, "K3"}, 
     {Sagittarius, Lambda, 2.83, 276.99, -25.43, "K1"}, 
     {Sagittarius, Pi, 2.89, 287.44, -21.02, "F2"}, 
     {Sagittarius, Gamma, 2.99, 271.45, -30.43, "K0"}, 
     {Sagittarius, Eta, 3.11, 274.41, -36.77, "M3"}, 
     {Sagittarius, Phi, 3.18, 281.42, -27., "B8"}, {Sagittarius, Tau, 3.31, 
      286.73, -27.67, "K1"}, {Scorpius, Alpha, 0.96, 247.35, -26.43, "M1"}, 
     {Scorpius, Lambda, 1.62, 263.4, -37.1, "B2"}, {Scorpius, Theta, 1.86, 
      264.33, -43., "F1"}, {Scorpius, Delta, 2.3, 240.08, -22.62, "B0"}, 
     {Scorpius, Epsilon, 2.3, 252.54, -34.3, "K2"}, 
     {Scorpius, Kappa, 2.41, 265.62, -39.03, "B1"}, 
     {Scorpius, Beta1, 2.63, 241.36, -19.8, "B1"}, {Scorpius, Upsilon, 2.7, 
      262.69, -37.3, "B2"}, {Scorpius, Tau, 2.83, 248.97, -28.22, "B0"}, 
     {Scorpius, Sigma, 2.88, 245.3, -25.58, "B2"}, 
     {Scorpius, Pi, 2.9, 239.71, -26.12, "B1"}, {Scorpius, Iota1, 3.03, 
      266.9, -40.12, "F2"}, {Scorpius, Mu1, 3.08, 252.97, -38.05, "B1"}, 
     {Scorpius, G, 3.21, 267.46, -37.05, "K2"}, {Scorpius, Eta, 3.33, 258.04, 
      -43.23, "F3"}, {Serpens, Alpha, 2.65, 236.07, 6.42, "K2"}, 
     {Serpens, Eta, 3.25, 275.32, -2.88, "K2"}, {Taurus, Alpha, 0.85, 68.98, 
      16.5, "K5"}, {Taurus, Beta, 1.65, 81.57, 28.6, "B7"}, 
     {Taurus, Eta, 2.87, 56.87, 24.12, "G9"}, {Taurus, Zeta, 2.98, 84.41, 
      21.15, "B4"}, {Taurus, Theta2, 3.4, 67.17, 15.87, "A7"}, 
     {Taurus, Lambda, 3.41, 60.17, 12.48, "B3"}, {Taurus, Epsilon, 3.53, 
      67.15, 19.18, "G9"}, {Taurus, Gamma, 3.63, 64.95, 15.62, "K0"}, 
     {Telescopium, Alpha, 3.51, 276.74, -45.97, "B3"}, 
     {Triangulum, Beta, 3., 32.38, 34.98, "A5"}, {Triangulum, Alpha, 3.41, 
      28.27, 29.58, "F6"}, {TriangulumAustrale, Alpha, 1.93, 252.17, -69.03, 
      "K2"}, {TriangulumAustrale, Beta, 2.84, 238.79, -63.43, "F2"}, 
     {TriangulumAustrale, Gamma, 2.89, 229.73, -68.68, "A1"}, 
     {Tucana, Alpha, 2.85, 334.62, -60.25, "K3"}, {UrsaMajor, Alpha, 1.79, 
      165.93, 61.75, "K0"}, {UrsaMajor, Epsilon, 1.79, 193.51, 55.95, "A0"}, 
     {UrsaMajor, Eta, 1.88, 206.88, 49.32, "B3"}, {UrsaMajor, Zeta, 2.27, 
      200.98, 54.93, "A1"}, {UrsaMajor, Beta, 2.38, 165.46, 56.38, "A1"}, 
     {UrsaMajor, Gamma, 2.43, 178.45, 53.7, "A0"}, {UrsaMajor, Psi, 3., 
      167.42, 44.48, "K1"}, {UrsaMajor, Mu, 3.03, 155.58, 41.5, "M0"}, 
     {UrsaMajor, Iota, 3.15, 134.8, 48.03, "A7"}, {UrsaMajor, Theta, 3.18, 
      143.21, 51.68, "F6"}, {UrsaMajor, Delta, 3.31, 183.86, 57.03, "A3"}, 
     {UrsaMajor, Omicron, 3.35, 127.57, 60.72, "G5"}, 
     {UrsaMajor, Lambda, 3.45, 154.28, 42.92, "A2"}, 
     {UrsaMajor, Nu, 3.48, 169.62, 33.1, "K3"}, {UrsaMinor, Alpha, 2.02, 
      37.96, 89.27, "F7"}, {UrsaMinor, Beta, 2.07, 222.68, 74.15, "K4"}, 
     {UrsaMinor, Gamma, 3.04, 230.18, 71.83, "A3"}, 
     {Vela, Gamma, 1.83, 122.38, -47.35, "O0"}, {Vela, Delta, 1.95, 131.18, 
      -54.72, "A1"}, {Vela, Lambda, 2.24, 137., -43.43, "K4"}, 
     {Vela, Kappa, 2.49, 140.53, -55.02, "B2"}, {Vela, Mu, 2.68, 161.69, 
      -49.43, "G5"}, {Vela, N, 3.12, 142.8, -57.03, "K5"}, 
     {Virgo, Alpha, 0.98, 201.3, -11.15, "B1"}, {Virgo, Epsilon, 2.83, 
      195.55, 10.97, "G8"}, {Virgo, Zeta, 3.36, 203.67, -0.6, "A3"}, 
     {Virgo, Delta, 3.37, 193.9, 3.38, "M3"}}
 
Stars250 /: Stars250::usage = "Stars250 is a list of the 250 brightest stars \
(down to magnitude 3.4). For each star it contains the constellationName, \
starName, magnitude, ascension (in degrees, not hours), and declination (in \
degrees)."
 
Clusters /: Clusters::trace = ""
 
Clusters /: Clusters::usage = "Clusters is an option to the various StarChart \
commands. By default it is set to True, but if set to False it will stop Star \
Clusters (including Open and Globular) being drawn on the chart."
 
Skyline /: Skyline::trace = ""
 
Skyline /: Skyline::usage = "Skyline is an option to the various StarChart \
commands. By default it is set to {}, but if set to some graphics primitives \
(involving Line, Rectangle, Disk, Circle, Point, Polygon, Text and RGBColor \
etc), then it will cause that sky outline to be mapped along the local \
horizon line."
 
OrbitTrack[___] := (Message[OrbitTrack::noavail, OrbitTrack]; )
 
Options[OrbitTrack] = {PlotPoints -> 25}
 
OrbitTrack /: OrbitTrack::noavail = 
     "This is just the demo version, and `1` is not available."
 
OrbitTrack /: OrbitTrack::usage = "OrbitTrack[object, date1, date2] produces \
an object which will eventually be drawn as a Line if it is passed via the \
Epilog or Prolog option to the commands StarChart, RadialStarChart, \
HorizonStarChart or ZenithStarChart. For example: StarChart[Sagittarius, \
Epilog->OrbitTrack[Mars,{1986,4,1},{1986,10,1}]]; If date2 is omitted a \
Point, rather than a Line, is drawn for date1. If date1 is also omitted a \
Point is drawn for the current Date[]. Use PlotPoints to adjust the \
resolution of the track. The default is PlotPoints->25."
 
PlanetColour[Earth] = RGBColor[0.25, 0.75, 1.]
 
PlanetColour[Jupiter] = RGBColor[0.9, 0.8, 0.6]
 
PlanetColour[Mars] = RGBColor[0.95, 0.8, 0.6]
 
PlanetColour[Mercury] = RGBColor[0.7, 0.9, 0.7]
 
PlanetColour[Moon] = RGBColor[0.9, 0.9, 0.9]
 
PlanetColour[Neptune] = RGBColor[0.5, 0.7, 1.]
 
PlanetColour[Pluto] = RGBColor[1., 1., 1.]
 
PlanetColour[Saturn] = RGBColor[1., 0.8, 0.6]
 
PlanetColour[Sun] = RGBColor[1., 1., 0.]
 
PlanetColour[Uranus] = RGBColor[0.3, 0.7, 0.2]
 
PlanetColour[Venus] = RGBColor[1., 1., 0.8]
 
PlanetColour[object_] = 
    RGBColor[1., 1., 1.]
 
Attributes[c$] = {Temporary}
 
date3form[{year_, 
      month_, day_, 
      hour_, minute_, 
      second_}] := Block[{MONTHS}, 
     MONTHS = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}; 
      StringJoin[If[day < 10, " ", ""], 
       ToString[day], "-", MONTHS[[
        month]], "-", ToString[year]]]
 
date3form[day_] := 
    date3form[LocalDate[day]]
 
date3form /: date3form::trace = ""
 
AppearanceP[___] := (Message[AppearanceP::noavail, AppearanceP]; )
 
Options[AppearanceP] = {ViewPoint -> Automatic}
 
AppearanceP /: AppearanceP::noavail = 
     "This is just the demo version, and `1` is not available."
 
AppearanceP /: AppearanceP::usage = "AppearanceP[object, date] returns some \
information about the general appearance of the object (a planet or star) on \
the given date. If date is omitted the current Date[] is used."
 
MagnitudeScale /: MagnitudeScale::trace = ""
 
MagnitudeScale /: MagnitudeScale::usage = "MagnitudeScale is an option to the \
various StarChart commands which scales up the size of the dots used to \
represent star magnitudes."
 
LunarEclipseP[___] := (Message[LunarEclipseP::noavail, LunarEclipseP]; )
 
LunarEclipseP /: LunarEclipseP::noavail = 
     "This is just the demo version, and `1` is not available."
 
LunarEclipseP /: LunarEclipseP::usage = "LunarEclipseP[neardate] computes the \
precise time of the next Lunar Eclipse after the given neardate. A Total \
Lunar Eclipse is visible from half the Earth (the side facing the Moon), \
where it can last up to 1 hour 44 minutes. A Partial Lunar Eclipse can last 4 \
hours. If neardate is omitted the current Date[] is used."
 
PlanetTilt[Earth] = 23.35
 
PlanetTilt[Jupiter] = 3.07
 
PlanetTilt[Mars] = 23.98
 
PlanetTilt[Mercury] = 2
 
PlanetTilt[Moon] = 6.68
 
PlanetTilt[Neptune] = 28.8
 
PlanetTilt[Pluto] = 122.5
 
PlanetTilt[Saturn] = 26.73
 
PlanetTilt[Sun] = 7.2
 
PlanetTilt[Uranus] = 97.92
 
PlanetTilt[Venus] = 178
 
PlanetTilt[object_] = 0
 
Separation[object_, opts___Rule] := 
    Separation[Sun, object, Date[], 
     opts]
 
Separation[object_, datum:
      {_Integer, _Integer, ___}, opts___Rule] := 
    Separation[Sun, object, ModifiedJulianDay[
      datum], opts]
 
Separation[object1_, object2_, 
     opts___Rule] := 
    Separation[object1, object2, 
     Date[], opts]
 
Separation[object1_, object2_, 
     datum_List, opts___Rule] := 
    Separation[object1, object2, 
     ModifiedJulianDay[datum], opts]
 
Separation[object1_, object2_, 
     day:_Real | _Integer, 
     opts___Rule] := 
    Block[{dx1, dy1, 
      dz1, dd1, 
      dx2, dy2, 
      dz2, dd2, 
      c}, 
     {dx1, dy1, 
        dz1} = Coordinates[object1, 
        day, opts]; 
      {dx2, dy2, 
        dz2} = Coordinates[object2, 
        day, opts]; 
      dd1 = dx1^2 + 
        dy1^2 + dz1^2; 
      If[dd1 <= 0, Return[0]]; dd2 = 
       dx2^2 + dy2^2 + 
        dz2^2; If[dd2 <= 0, 
       Return[0]]; c = 
       (dx1*dx2 + 
         dy1*dy2 + 
         dz1*dz2)/
        Sqrt[dd1*dd2]; 
      If[-1 < c < 1, ArcCos[c]/
         N[Degree], If[c > 0, 0., 180.]]*Degree]
 
Separation /: Separation::trace = ""
 
Separation /: Separation::usage = "Separation[object1, object2, date] returns \
the angular separation of the two objects (which may be planets, Sun, Moon, \
asteroids or stars etc) on the given date. If date is omitted the current \
Date[] is used. And if only one object is given, then the other object is \
assumed to be the Sun."
 
Attributes[s$] = {Temporary}
 
MakeBoxes[EphemerisData[object_, 
      {(day_)?NumberQ, viewpoint_}, 
      {(elongation_)?NumberQ, 
       (distance_)?NumberQ}, 
      {(ascension_)?NumberQ, 
       (declination_)?NumberQ}, 
      {(longitude_)?NumberQ, 
       (latitude_)?NumberQ}, 
      {rising_, setting_}, 
      {SunriseP_, SunsetP_}, 
      {(azimuth_)?NumberQ, 
       (altitude_)?NumberQ}, 
      {(magnitude_)?NumberQ, (phase_)?
        NumberQ}], FormatType_] ^:= 
    Format[Block[{zodiac, starsign, 
       eastwest, updown, 
       direction, distKM, 
       AA, BB, CC, 
       string}, zodiac = 
        {"Pisces      ", "Aries       ", "Taurus      ", "Gemini      ", 
         "Cancer      ", "Leo         ", "Virgo       ", "Libra       ", 
         "Scorpius    ", "Sagittarius ", "Capricornus ", "Aquarius    "}; 
       starsign = zodiac[[
         Floor[1 + ascension/2]]]; 
       eastwest = If[elongation > 0, 
         "Evening sky.", "Morning sky."]; 
       If[Chop[elongation] === 0, 
        eastwest = "DawnDuskSky."]; 
       updown = 
        If[NumberQ[altitude] && 
          altitude < 0, "Below the horizon", 
         "Above the horizon"]; direction = 
        Switch[Mod[Round[azimuth/45.], 8], 0, 
         "North     compass", 1, "NorthEast compass", 2, "East      compass", 
         3, "SouthEast compass", 4, "South     compass", 5, 
         "SouthWest compass", 6, "West      compass", 7, "NorthWest compass", 
         _, "North     compass"]; distKM = 
        Abs[distance]*149597900; 
       {AA, BB, CC} = 
        Which[distKM > 30.*10^6, 
         {distance, {4, 2}, " AU"}, 
         distKM > 999.9*10^3, 
         {distKM/10^6, {4, 1}, " Gm"}, 
         distKM > 999.9, {distKM/
           10^3, {4, 1}, " Mm"}, distKM > 0.1, 
         {distKM, {4, 1}, " km"}, _, 
         {0., {4, 1}, " km"}]; string = 
        StringJoin[ToString[object], "\n", 
         "------------------------------------------\n", "Date Time:   ", 
         dateform[day], " (", 
         GMTstyle[GMT$diff], ")\n", 
         "Geo-place:    ", degs$and$minOfLongitude[
          Geo$Longitude], ",", 
         degs$and$minOfLatitude[
          Geo$Latitude], " (Earth.)\n", 
         "------- For Date, Geo-place: -------------\n", "Rising:       ", 
         hourAMPM[rising], 
         " (SunriseP: ", hourAMPM[
          SunriseP], ")\n", "Setting:      ", 
         hourAMPM[setting], 
         " (SunsetP:  ", hourAMPM[
          SunsetP], ")\n", 
         "------- For Date Time, Geo-place: --------\n", "Azimuth:      ", 
         degs$and$min[azimuth], " (", 
         direction, ")\n", "Altitude:     ", 
         degs$and$min[altitude], 
         " (", updown, ")\n", 
         "------- For Date Time: -------------------\n", "Elongation:   ", 
         degs$and$min[elongation], 
         " (", eastwest, ToString[
          PaddedForm[Round[100*phase], 3]], "%", ")\n", 
         "Distance:    ", If[Abs[distance] > 99.99, 
          "******", ToString[PaddedForm[AA, 
            BB, NumberPadding -> {" ", "0"}]]], CC, 
         " (Magnitude:  ", If[Abs[magnitude] > 99.99, 
          "*****", ToString[PaddedForm[magnitude, {3, 1}, 
            NumberSigns -> {"-", "+"}, NumberPadding -> {" ", "0"}]]], ")\n", 
         "------- For Date Time: -------------------\n", "Ascension:    ", 
         hour$and$min[ascension], 
         " (", starsign, ToString[
          PaddedForm[Round[Mod[15*ascension, 360]], 3]], 
         $DegreeCharacter, ")\n", "Declination:  ", 
         degs$and$min[declination], 
         " (Ecliptic ", degs$and$min2[
          latitude], ")\n", 
         "------------------------------------------"]; 
       Print[string]; "-EphemerisData-"], FormatType]
 
Format[EphemerisData[object_, 
      {(day_)?NumberQ, viewpoint_}, 
      {(elongation_)?NumberQ, 
       (distance_)?NumberQ}, 
      {(ascension_)?NumberQ, 
       (declination_)?NumberQ}, 
      {(longitude_)?NumberQ, 
       (latitude_)?NumberQ}, 
      {rising_, setting_}, 
      {SunriseP_, SunsetP_}, 
      {(azimuth_)?NumberQ, 
       (altitude_)?NumberQ}, 
      {(magnitude_)?NumberQ, (phase_)?
        NumberQ}]] := Block[{zodiac, 
      starsign, eastwest, 
      updown, direction, 
      distKM, AA, 
      BB, CC, string}, 
     zodiac = {"Pisces      ", "Aries       ", 
        "Taurus      ", "Gemini      ", "Cancer      ", "Leo         ", 
        "Virgo       ", "Libra       ", "Scorpius    ", "Sagittarius ", 
        "Capricornus ", "Aquarius    "}; starsign = 
       zodiac[[Floor[1 + ascension/
           2]]]; eastwest = 
       If[elongation > 0, "Evening sky.", 
        "Morning sky."]; If[Chop[elongation] === 0, 
       eastwest = "DawnDuskSky."]; 
      updown = 
       If[NumberQ[altitude] && 
         altitude < 0, "Below the horizon", 
        "Above the horizon"]; direction = 
       Switch[Mod[Round[azimuth/45.], 8], 0, 
        "North     compass", 1, "NorthEast compass", 2, "East      compass", 
        3, "SouthEast compass", 4, "South     compass", 5, 
        "SouthWest compass", 6, "West      compass", 7, "NorthWest compass", 
        _, "North     compass"]; distKM = 
       Abs[distance]*149597900; 
      {AA, BB, CC} = 
       Which[distKM > 30.*10^6, 
        {distance, {4, 2}, " AU"}, 
        distKM > 999.9*10^3, 
        {distKM/10^6, {4, 1}, " Gm"}, 
        distKM > 999.9, {distKM/10^3, 
         {4, 1}, " Mm"}, distKM > 0.1, 
        {distKM, {4, 1}, " km"}, _, {0., {4, 1}, " km"}]; 
      string = StringJoin[
        ToString[object], "\n", 
        "------------------------------------------\n", "Date Time:   ", 
        dateform[day], " (", 
        GMTstyle[GMT$diff], ")\n", 
        "Geo-place:    ", degs$and$minOfLongitude[
         Geo$Longitude], ",", 
        degs$and$minOfLatitude[
         Geo$Latitude], " (Earth.)\n", 
        "------- For Date, Geo-place: -------------\n", "Rising:       ", 
        hourAMPM[rising], 
        " (SunriseP: ", hourAMPM[
         SunriseP], ")\n", "Setting:      ", 
        hourAMPM[setting], 
        " (SunsetP:  ", hourAMPM[
         SunsetP], ")\n", 
        "------- For Date Time, Geo-place: --------\n", "Azimuth:      ", 
        degs$and$min[azimuth], " (", 
        direction, ")\n", "Altitude:     ", 
        degs$and$min[altitude], " (", 
        updown, ")\n", 
        "------- For Date Time: -------------------\n", "Elongation:   ", 
        degs$and$min[elongation], 
        " (", eastwest, ToString[
         PaddedForm[Round[100*phase], 3]], "%", ")\n", 
        "Distance:    ", If[Abs[distance] > 99.99, 
         "******", ToString[PaddedForm[AA, 
           BB, NumberPadding -> {" ", "0"}]]], CC, 
        " (Magnitude:  ", If[Abs[magnitude] > 99.99, 
         "*****", ToString[PaddedForm[magnitude, {3, 1}, 
           NumberSigns -> {"-", "+"}, NumberPadding -> {" ", "0"}]]], ")\n", 
        "------- For Date Time: -------------------\n", "Ascension:    ", 
        hour$and$min[ascension], 
        " (", starsign, ToString[
         PaddedForm[Round[Mod[15*ascension, 360]], 3]], 
        $DegreeCharacter, ")\n", "Declination:  ", 
        degs$and$min[declination], 
        " (Ecliptic ", degs$and$min2[
         latitude], ")\n", 
        "------------------------------------------"]; 
      Print[string]; "-EphemerisData-"]
 
EphemerisData /: EphemerisData::trace = ""
 
EphemerisData /: EphemerisData::usage = "EphemerisData[object, {epochday, \
viewpoint}, {elongation, distance}, {ascension, declination}, {longitude, \
latitude}, {rising, setting}, {SunriseP, SunsetP}, {azimuth, altitude}, \
{magnitude, phase}] represents the ephemeris data returned by \
Ephemeris[object, date]."
 
Attributes[MakeBoxes] = {HoldAllComplete}
 
degs$and$minOfLatitude[deg_] := 
    StringJoin[degs$and$min[
      Abs[deg]], If[deg < 0, "S", 
      "N"]]
 
degs$and$minOfLatitude /: 
    degs$and$minOfLatitude::trace = ""
 
hourAMPM[CIRCUMPOLAR + _] := 
    "No Sets "
 
hourAMPM[NEVERRISES + _] := "No Rises"
 
hourAMPM[NEVERSETS + _] := "No Sets "
 
hourAMPM[INVISIBLE + _] := "No Rises"
 
hourAMPM[hour_] := 
    Block[{h5, h, 
      m}, h5 = 
       Mod[Round[60*hour]/60., 24]; 
      If[h5 < 0, h5 += 24]; 
      h = Mod[Floor[h5] + 11, 12] + 
        1; h = If[h < 10, 
        StringJoin[" ", ToString[h]], 
        ToString[h]]; m = 
       ToString[twodigits[
         Round[60*Mod[h5, 1]]]]; 
      StringJoin[h, ":", m, 
       If[h5 > 12, " pm", " am"]]]
 
hourAMPM /: hourAMPM::trace = ""
 
degs$and$min2[angle_] := 
    Block[{L, deg, minutes, 
      signAng}, If[angle < 0, 
       signAng = "- ", signAng = 
        "+ "]; L = Abs[angle] + 0.5/60; 
      deg = Floor[L]; L -= deg; 
      minutes = Floor[60*L]; 
      If[deg < 10, deg = 
        StringJoin[" ", ToString[deg]], 
       deg = ToString[deg]]; 
      If[minutes < 10, minutes = 
        StringJoin["0", ToString[minutes]], 
       minutes = ToString[minutes]]; 
      StringJoin[signAng, deg, 
       $DegreeCharacter, minutes, "'"]]
 
degs$and$min2 /: 
    degs$and$min2::trace = ""
 
HorizonCoordinates[Zenith, ___] := {Azimuth -> 0, Altitude -> 90*Degree}
 
HorizonCoordinates[Nadir, ___] := {Azimuth -> 0, Altitude -> -90*Degree}
 
HorizonCoordinates[North, ___] := {Azimuth -> 0*Degree, Altitude -> 0*Degree}
 
HorizonCoordinates[South, ___] := {Azimuth -> 180*Degree, 
     Altitude -> 0*Degree}
 
HorizonCoordinates[East, ___] := {Azimuth -> 90*Degree, Altitude -> 0*Degree}
 
HorizonCoordinates[West, ___] := {Azimuth -> 270*Degree, Altitude -> 0*Degree}
 
HorizonCoordinates[{ecoords___Rule}, 
     day:_Real | _Integer, 
     opts___Rule] := e2hCoordinates[
     {ecoords}, day, 
     opts]
 
HorizonCoordinates[object_, 
     opts___Rule] := HorizonCoordinates[
     object, Date[], opts]
 
HorizonCoordinates[object_, 
     datum_List, opts___Rule] := 
    HorizonCoordinates[object, 
     ModifiedJulianDay[datum], opts]
 
HorizonCoordinates[object_, day:
      _Real | _Integer, opts___Rule] := 
    Block[{ascension, declination, 
      distance, ha, 
      dec, sx, 
      cx, sy, cy, 
      az, alt, 
      azimuth, altitude}, 
     {ascension, declination, 
        distance} = {Ascension, Declination, Distance} /. 
        EquatorCoordinates[object, 
         day, Epoch -> Automatic, 
         opts]; ha = 
       N[ascension - (Geo$Longitude + 
           360*(day - Floor[day]) + 
           SolarMeanLongitude[day] - 
           180)*Degree]; dec = 
       N[declination]; sx = 
       Sin[ha]; cx = 
       Cos[ha]; sy = 
       Sin[dec]; cy = 
       Cos[dec]; alt = 
       ArcSin[sy*Sin$Geo$Latitude + 
         cy*cx*
          Cos$Geo$Latitude]; 
      altitude = N[alt/Degree]; 
      If[Chop[Abs[altitude] - 90] === 0, 
       azimuth = 0., az = 
         ArcTan[-(cy*cx*
             Sin$Geo$Latitude) + sy*
            Cos$Geo$Latitude, cy*
           sx]; azimuth = 
         Mod[az/N[Degree], 360]]; 
      If[distance =!= Distance, 
       {Azimuth -> azimuth*Degree, 
        Altitude -> altitude*Degree, 
        Distance -> distance}, 
       {Azimuth -> azimuth*Degree, 
        Altitude -> altitude*Degree}]]
 
HorizonCoordinates /: HorizonCoordinates::trace = ""
 
HorizonCoordinates /: HorizonCoordinates::usage = "HorizonCoordinates[object, \
date] returns the Azimuth, Altitude and Distance of the object (a planet or a \
star) on the given date. An example planet would be Mars, and an example star \
would be Alpha.Centaurus. HorizonCoordinates[equatorcoords, date] will \
convert the equatorcoords into horizoncoords for the current location. An \
example equatorcoords would be {Ascension->18*Hour, Declination->30*Degree}. \
If date is omitted the current Date[] is used."
 
HourAngle[___] := (Message[HourAngle::noavail, HourAngle]; )
 
HourAngle /: HourAngle::noavail = 
     "This is just the demo version, and `1` is not available."
 
HourAngle /: HourAngle::usage = "HourAngle[object, date] returns the time \
elapsed since the object (a planet or a star) crossed the Meridian line for \
the given date. An example usage would be: HourAngle[Beta.Leo, \
{1993,11,17,3,20,0}], which would return -6.09603 Hour, meaning that the star \
Beta.Leo will be crossing the local Meridian line in 6 hours time after \
{1993,11,17,3,20,0}. If date is omitted the current Date[] is used."
 
SiderealTimeP[___] := (Message[SiderealTimeP::noavail, SiderealTimeP]; )
 
SiderealTimeP /: SiderealTimeP::noavail = 
     "This is just the demo version, and `1` is not available."
 
SiderealTimeP /: SiderealTimeP::usage = "SiderealTimeP[date] returns the Right \
Ascension of the Meridian line for the given date. That Ascension hour is \
equivalent to Sidereal Time. An example usage would be: \
SiderealTimeP[{1993,11,17,3,20,0}], which would return 5.71672 Hour, and this \
Ascension roughly corresponds to the zodiac constellation of Taurus. That \
constellation will therefore be crossing the Meridian on {1993,11,17,3,20,0}. \
If date is omitted the current Date[] is used."
 
PlanetChart[___] := (Message[PlanetChart::noavail, PlanetChart]; )
 
PlanetChart /: PlanetChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
PlanetChart /: PlanetChart::usage = "PlanetChart[year] returns a graphic \
showing a social calendar for the heavens during the year. All information in \
the chart is completely independent of your position on Earth. To use the \
chart just select the date down the left side, and read horizontally across \
to a planet line. The diagonal coloured bands will indicate whether the \
planet will be visible mostly in the morning or evening sky. Next read \
vertically downwards to find where the planet will be in relation to the \
Ecliptic stars on that date. If year is omitted the current year is used."
 
NewMoonP[___] := (Message[NewMoonP::noavail, NewMoonP]; )
 
NewMoonP /: NewMoonP::noavail = 
     "This is just the demo version, and `1` is not available."
 
NewMoonP /: NewMoonP::usage = "NewMoonP[neardate] computes the precise date of \
the New Moon closest to neardate. If neardate is omitted the current Date[] \
is used."
 
MagnitudeRange /: MagnitudeRange::trace = ""
 
MagnitudeRange /: MagnitudeRange::usage = "MagnitudeRange is an option to the \
various StarChart commands which specifies the range of star magnitude to be \
displayed."
 
MoonShadow[___] := (Message[MoonShadow::noavail, MoonShadow]; )
 
MoonShadow /: MoonShadow::noavail = 
     "This is just the demo version, and `1` is not available."
 
MoonShadow /: MoonShadow::usage = "MoonShadow[date] returns a list of rules \
giving the GeoLongitude and GeoLatitude of the centre of the Moon's shadow \
assuming it falls on the Earth's surface. The degree of Totality of that \
shadow is also given, and is represented as a number so that 0.9 would mean \
90% of the Sun is covered by the Moon. Totality's greater than 1 therefore \
correspond to Total Solar Eclipses, and Totality's less than 1 to Annular \
Solar Eclipses. For dates other than during a Solar Eclipse, the Moon's \
shadow will not fall on the Earth's surface. In such cases the MoonShadow \
command just returns an empty list of rules, {}, to indicate that there is no \
shadow."
 
JupiterGreatRedSpot /: JupiterGreatRedSpot::trace = ""
 
JupiterGreatRedSpot /: JupiterGreatRedSpot::usage = "JupiterGreatRedSpot is \
the cloud orbiting Jupiter. See also ?$JupiterGreatRedSpotLongitude."
 
sText[text_, 
     pos___] := Text[FontForm[text, 
      {"Helvetica", 10}], pos]
 
sText /: sText::trace = ""
 
TransitVisible /: TransitVisible::trace = ""
 
TransitVisible /: TransitVisible::usage = "TransitVisible is an eventdate \
output by the BestView command. When a low orbit Earth satellite is crossing \
the local Meridian line and is still illuminated by the Sun, but the viewer \
location is still in darkness, then the satellite is TransitVisible. This is \
a fairly rare event as most satellites are only a few hundred kilometres \
above the Earth's surface, and hence a satellite would normally be eclipsed \
by the Sun when the Earth's surface is in darkness. However there is a very \
small window when this is not the case."
 
PlanetLabels /: PlanetLabels::trace = ""
 
PlanetLabels /: PlanetLabels::usage = "PlanetLabels is an option to the \
various StarChart commands. By default it is set to False, but if set to True \
it will cause the planet labels to be drawn on the chart."
 
TwoLineElements[___] := (Message[TwoLineElements::noavail, TwoLineElements]; )
 
TwoLineElements /: TwoLineElements::noavail = 
     "This is just the demo version, and `1` is not available."
 
TwoLineElements /: TwoLineElements::usage = "TwoLineElements[line1, line2] \
converts from standard NORAD Two-Line Orbital Element Set Format, into rules \
suitable for use with the SetOrbitalElements command. For example the \
Two-Line Elements for the Mir Space Station, can be converted using: \
TwoLineElements[ \n  \"1 16609U 86017A   94128.91132311  .00004573  00000-0  \
64054-4 0  5919\",\n  \"2 16609  51.6470  22.8994 0014424 234.0113 125.9536 \
15.58936412469925\"]; \n\tBut remember that such elements sets are only \
accurate for a few months from the epoch date (the epoch date for this \
element set is the 128.9th day of 1994)."
 
HorizonStarChart[___] := (Message[HorizonStarChart::noavail, 
      HorizonStarChart]; )
 
HorizonStarChart /: HorizonStarChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
HorizonStarChart /: HorizonStarChart::usage = "HorizonStarChart[direction, \
date] shows the star field in the compass direction (either North, South, \
East or West, or a compass angle in degrees) on the given date. The field of \
view is 180 degrees along the horizon which is shown as the line along the \
bottom. The Zenith is shown 90 degrees above at the top. If date is omitted \
the current Date[] is used. If direction is omitted then South is used if \
your location is in the northern hemisphere, and North is used if your \
location is in the southern hemisphere. Any StarChart option can be used with \
the HorizonStarChart command, except for RadialAngle which is essentially \
fixed at 90*Degree."
 
Totality /: Totality::trace = ""
 
Totality /: Totality::usage = "Totality is a name used by MoonShadow that \
represents the degree of Totality of an Annular of Total Solar Eclipse. A \
Totality of 0.9 would mean that 90% of the Sun is covered by the Moon. \
Totality's greater than 1 therefore correspond to Total Solar Eclipses, and \
Totality's less than 1 to Annular Solar Eclipses."
 
EclipseBegin[___] := (Message[EclipseBegin::noavail, EclipseBegin]; )
 
EclipseBegin /: EclipseBegin::noavail = 
     "This is just the demo version, and `1` is not available."
 
EclipseBegin /: EclipseBegin::usage = "EclipseBegin[object1, object2, \
object3, neardate] returns the precise date, near the neardate, at which \
object1 will just begin to be eclipsed by object2 from the light from \
object3. The object3 is treated as a point source, but the diameters of \
object1 and object2 are taken into account. The command effectively tests for \
the beginning of a *partial* eclipse. If object3 is omitted then the Sun is \
used. If object2 is omitted then the Earth is used (unless object1 is itself \
the Earth in which case the Moon is used). Thus EclipseBegin[Mir, neardate] \
will return the precise time at which the object Mir will cease to be \
illuminated by the Sun, because it enters the Earth's shadow. If date is \
omitted the current Date[] is used."
 
PlanetTiltLongitude[Earth] = 180
 
PlanetTiltLongitude[Jupiter] = -44.5
 
PlanetTiltLongitude[Mars] = 88
 
PlanetTiltLongitude[Moon] = 106
 
PlanetTiltLongitude[Neptune] = 41
 
PlanetTiltLongitude[Pluto] = 41
 
PlanetTiltLongitude[Saturn] = 168
 
PlanetTiltLongitude[Sun] = 76
 
PlanetTiltLongitude[Uranus] = 345
 
PlanetTiltLongitude[object_] = 0
 
UmbraDiameter /: UmbraDiameter::trace = ""
 
UmbraDiameter /: UmbraDiameter::usage = "UmbraDiameter is a name used by \
EarthShadow that represents the angular diameter of the total shadow of the \
Earth projected at the distance of the Moon."
 
MoonSet[___] := (Message[MoonSet::noavail, MoonSet]; )
 
MoonSet /: MoonSet::noavail = 
     "This is just the demo version, and `1` is not available."
 
MoonSet /: MoonSet::usage = "MoonSet[neardate] computes the precise time of \
the Moon set on the day of the given neardate. If neardate is omitted the \
current Date[] is used."
 
Lunation[___] := (Message[Lunation::noavail, Lunation]; )
 
Lunation /: Lunation::noavail = 
     "This is just the demo version, and `1` is not available."
 
Lunation /: Lunation::usage = "Lunation[n] gives the date on which the n'th \
New Moon will occur. New Moon's are arbitrarily numbered so that n=0 is the \
New Moon on 1-Jan-1900 13:50:53 (UT). Use Lunation[n+0.5], with n an integer, \
to find Full Moon's. See also ?LunationNumberP."
 
StarChart[___] := (Message[StarChart::noavail, StarChart]; )
 
Options[StarChart] = {RadialAngle -> 20*Degree, MagnitudeRange -> 
      {-Infinity, Infinity}, MagnitudeScale -> 1, Skyline -> {}, 
     Horizon -> False, Mesh -> False, Ecliptic -> True, 
     Constellations -> True, Planets -> None, PlanetLabels -> False, 
     ConstellationLabels -> False, StarLabels -> False, Clusters -> True, 
     Galaxies -> False, StarColors -> False, Background -> Automatic}
 
StarChart /: StarChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
StarChart /: StarChart::usage = "StarChart[region] plots a section of the sky \
centered on the given region. A region can be one of the 88 constellations \
which includes the zodiac constellations: Capricornus, Aquarius, Pisces, \
Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpius or Sagittarius. A \
region can also be one of eight large sectors covering the entire celestial \
sphere. These sectors are named Sector1, Sector2, Sector3, Sector4, Sector5, \
Sector6, and SectorN, SectorS. By default only the brightest 250 stars are \
used by StarChart, but you can load extra stars such as those in the \
Star2500.m file which includes the brightest 2500 stars. You can artificially \
brighten, or fainten, the stars by using the MagnitudeScale option. \
StarChart[region, date, Planets->planets] can be used to show additional red \
dots for the position of the planets on the given date. In this form the Sun \
is indicated with a yellow dot, and the Moon with a gray dot. If date is \
omitted the current Date[] is used. See also ?OrbitTrack for a method of \
superimposing planet tracks. See ?ChartCoordinates and ?ChartPosition for a \
more general way of annotating charts. The option Horizon->True can be used \
to draw the line of the Horizon. If the region is omitted, then the entire \
celestial sphere is plotted. StarChart[{{ascMin, ascMax}, {decMin, decMax}}] \
plots a rectangular region of the sky with 15*Ascension/Hour between ascMin \
and ascMax, and Declination/Degree between decMin and decMax."
 
GetOrbitalElements[___] := (Message[GetOrbitalElements::noavail, 
      GetOrbitalElements]; )
 
GetOrbitalElements /: GetOrbitalElements::noavail = 
     "This is just the demo version, and `1` is not available."
 
GetOrbitalElements /: GetOrbitalElements::usage = 
     "GetOrbitalElements[object] returns the orbital elements of the object."
 
JupiterWhiteSpotBC /: JupiterWhiteSpotBC::trace = ""
 
JupiterWhiteSpotBC /: JupiterWhiteSpotBC::usage = "JupiterWhiteSpotBC is the \
cloud orbiting Jupiter. See also ?$JupiterWhiteSpotBCLongitude."
 
EarthShadow[___] := (Message[EarthShadow::noavail, EarthShadow]; )
 
EarthShadow /: EarthShadow::noavail = 
     "This is just the demo version, and `1` is not available."
 
EarthShadow /: EarthShadow::usage = "EarthShadow[date] returns a list of \
rules giving the Ascension, Declination, UmbraDiameter and PenumbraDiameter \
of the Earth's shadow projected at the distance of the Moon. If date is \
omitted the current Date[] is used."
 
JupiterWhiteSpotDE /: JupiterWhiteSpotDE::trace = ""
 
JupiterWhiteSpotDE /: JupiterWhiteSpotDE::usage = "JupiterWhiteSpotDE is the \
cloud orbiting Jupiter. See also ?$JupiterWhiteSpotDELongitude."
 
JupiterWhiteSpotFA /: JupiterWhiteSpotFA::trace = ""
 
JupiterWhiteSpotFA /: JupiterWhiteSpotFA::usage = "JupiterWhiteSpotFA is the \
cloud orbiting Jupiter. See also ?$JupiterWhiteSpotFALongitude."
 
MoonCalendar[___] := (Message[MoonCalendar::noavail, MoonCalendar]; )
 
MoonCalendar /: MoonCalendar::noavail = 
     "This is just the demo version, and `1` is not available."
 
MoonCalendar /: MoonCalendar::usage = "MoonCalendar[year] returns a table \
showing a calendar of the Moon's phases for the given year. If year is \
omitted the current year is used."
 
ftext /: ftext::trace = ""
 
fText[text_, 
     pos___] := Text[FontForm[text, 
      {"Helvetica", 9}], pos]
 
Ephemeris[object_, opts___Rule] := 
    Ephemeris[object, Date[], opts]
 
Ephemeris[object_, datum_List, 
     opts___Rule] := 
    Ephemeris[object, ModifiedJulianDay[
      datum], opts]
 
Ephemeris[object_, day:
      _Real | _Integer, opts___Rule] := 
    Block[{viewpoint, longitude, 
      latitude, ascension, 
      declination, elongation, 
      distance, sundecl, 
      SunsetP, SunriseP, 
      sml, rising, 
      setting, azimuth, 
      altitude, amag, 
      phase, hour, 
      ha, dx, dy, 
      dz, dr, 
      tilt, c, s, 
      dy1, dz1, 
      Solar$Longitude, epoch, 
      viewxyz, planxyz, 
      d1, d2}, 
     planxyz = GetCoords[
        object, day]; 
      If[ListQ[object], viewpoint = 
         ViewPoint; viewxyz = {0, 0, 0}, 
       viewpoint = 
         ViewPoint /. {opts} /. Options[Coordinates]; 
        viewxyz = GetCoords[
          viewpoint, day]]; 
      d1 = {0, 0, 0} - planxyz; 
      d2 = viewxyz - 
        planxyz; {dx, 
        dy, dz} = 
       -d2; If[Chop[d2] === 
        {0, 0, 0}, Message[Ephemeris::bview, object]; 
        Return[Null]]; dr = 
       Sqrt[dx^2 + dy^2]; 
      latitude = ArcTan[dr, 
         dz]/N[Degree]; 
      If[Chop[Abs[latitude] - 90] === 0, 
       longitude = 0., longitude = 
         ArcTan[dx, dy]/N[Degree]; 
        If[longitude < 0, 
         longitude += 360]]; 
      distance = Sqrt[dr^2 + 
         dz^2]; tilt = 
       EarthTilt[day]*N[Degree]; 
      c = Cos[tilt]; 
      s = Sin[tilt]; 
      dy1 = c*
         dy - s*
         dz; dz1 = 
       s*dy + c*
         dz; dr = 
       Sqrt[dx^2 + dy1^2]; 
      declination = ArcTan[dr, 
         dz1]/N[Degree]; 
      If[Chop[Abs[declination] - 90] === 0, 
       ascension = 0., ascension = 
         ArcTan[dx, dy1]/N[Hour]; 
        If[ascension < 0, 
         ascension += 24]]; 
      Solar$Longitude = 
       SolarLongitudeP[day]; 
      elongation = Mod[longitude - 
         Solar$Longitude, 360]; 
      If[elongation > 180, 
       elongation -= 360]; sml = 
       SolarMeanLongitude[day]; 
      ha = -((Geo$Longitude + 
          sml)/15); {rising, 
        setting} = RiseSet[
        {ascension + ha + 
          GMT$diff, declination}]; 
      {rising, setting} = 
       {-2, 2}/60. + {rising, 
         setting}; sundecl = 
       23.44*Sin[sml*N[Degree]]; 
      {SunriseP, SunsetP} = 
       RiseSet[{Solar$Longitude/15 + 
          ha + GMT$diff, 
         sundecl}]; {SunriseP, 
        SunsetP} = {-2, 2}/60. + 
        {SunriseP, SunsetP}; 
      hour = 24*(day - 
         Floor[day]); {azimuth, 
        altitude} = HaDecToAzAlt[
        {ascension + ha + 12 - 
          hour, declination}]; 
      c = If[Chop[d1] === {0, 0, 0}, 
        1., d1 . d2/
         Sqrt[d1 . d1*
           d2 . d2]]; 
      phase = (1 + c)/2.; 
      amag = magnitude[
        object, distance, 
        phase]; epoch = 
       Epoch /. {opts} /. Options[Ephemeris]; 
      If[NumberQ[epoch], {ascension, 
         declination} = epochChange[
         day, {ascension, 
          declination}, (epoch - 
           1900.)*365.2425]]; EphemerisData[object, 
       {day, viewpoint}, 
       {elongation, distance}, 
       {ascension, declination}, 
       {longitude, latitude}, 
       {rising, setting}, 
       {SunriseP, SunsetP}, 
       {azimuth, altitude}, 
       {amag, phase}]]
 
Options[Ephemeris] = {Epoch -> Automatic}
 
Ephemeris /: Ephemeris::bview = "Cannot view object `1` from ViewPoint->`1`."
 
Ephemeris /: Ephemeris::trace = ""
 
Ephemeris /: Ephemeris::usage = "Ephemeris[object, date] returns ephemeris \
details for the object (a planet or a star, or Sun, Moon or asteroid) on the \
given date. If date is omitted the current Date[] is used. An EphemerisData \
object is returned."
 
constellCentres = {{Andromeda, 0.5, 36}, 
     {Antlia, 10.5, -34}, {Apus, 16., -78}, {Aquarius, 22.5, -10}, 
     {Aquila, 19.5, 5}, {Ara, 17.5, -53}, {Aries, 2.5, 21}, 
     {Auriga, 5.5, 40}, {Bootes, 14.5, 25}, {Caelum, 4.5, -40}, 
     {Camelopardalis, 5., 66}, {Cancer, 8.5, 17}, {CanesVenatici, 13., 40}, 
     {CanisMajor, 7., -22}, {CanisMinor, 7.5, 7}, {Capricornus, 21., -19}, 
     {Carina, 8.5, -61}, {Cassiopeia, 1., 62}, {Centaurus, 13.5, -45}, 
     {Cepheus, 22.5, 70}, {Cetus, 1.5, -13}, {Chamaeleon, 10.5, -80}, 
     {Circinus, 14.5, -64}, {Columba, 6., -38}, {ComaBerenices, 13., 25}, 
     {CoronaAustralis, 19., -41}, {CoronaBorealis, 15.5, 29}, 
     {Corvus, 12.5, -20}, {Crater, 11.5, -17}, {Crux, 12.5, -61}, 
     {Cygnus, 20., 37}, {Delphinus, 20.5, 14}, {Dorado, 5., -61}, 
     {Draco, 17., 64}, {Equuleus, 21., 9}, {Eridanus, 4., -16}, 
     {Fornax, 3., -31}, {Gemini, 7., 24}, {Grus, 22.5, -45}, 
     {Hercules, 17., 28}, {Horologium, 2.5, -50}, {Hydra, 10., -15}, 
     {Hydrus, 2.5, -72}, {Indus, 21.5, -55}, {Lacerta, 22.5, 47}, 
     {Leo, 10.5, 16}, {LeoMinor, 10.5, 35}, {Lepus, 5., -20}, 
     {Libra, 15., -21}, {Lupus, 15., -46}, {Lynx, 8., 44}, {Lyra, 18.5, 35}, 
     {Mensa, 5., -77}, {Microscopium, 21., -40}, {Monoceros, 7., 0}, 
     {Musca, 12.5, -70}, {Norma, 16., -52}, {Octans, 21., -82}, 
     {Ophiuchus, 17., 0}, {Orion, 5.5, 3}, {Pavo, 19.5, -66}, 
     {Pegasus, 22.5, 19}, {Perseus, 3.5, 45}, {Phoenix, 1., -48}, 
     {Pictor, 7., -63}, {Pisces, 0.5, 10}, {PiscisAustrinus, 23., -28}, 
     {Puppis, 8., -34}, {Pyxis, 9., -30}, {Reticulum, 4., -61}, 
     {Sagitta, 19.5, 18}, {Sagittarius, 19., -25}, {Scorpius, 17., -32}, 
     {Sculptor, 0., -30}, {Scutum, 18.5, -10}, {Serpens, 18., -5}, 
     {Sextans, 10., -4}, {Taurus, 5., 20}, {Telescopium, 19., -51}, 
     {Triangulum, 2., 31}, {TriangulumAustrale, 16., -66}, 
     {Tucana, 22.5, -59}, {UrsaMajor, 12., 59}, {UrsaMinor, 14., 73}, 
     {Vela, 9.5, -49}, {Virgo, 13.5, -4}, {Volans, 8., -70}, 
     {Vulpecula, 20., 25}}
 
filterOptions[command_Symbol, 
     {opts___}] := 
    Block[{keywords = 
       First /@ Options[command]}, 
     Sequence @@ Select[{opts}, 
       MemberQ[keywords, First[#1]] & ]]
 
filterOptions /: 
    filterOptions::trace = ""
 
Transit /: Transit::trace = ""
 
Transit /: Transit::usage = "Transit is an eventdate output by the BestView \
command. It is the time when an object, such as a star, crosses the local \
Meridian line."
 
UpdateRadialStarChart = True
 
JupiterMoonChart[___] := (Message[JupiterMoonChart::noavail, 
      JupiterMoonChart]; )
 
JupiterMoonChart /: JupiterMoonChart::noavail = 
     "This is just the demo version, and `1` is not available."
 
JupiterMoonChart /: JupiterMoonChart::usage = "JupiterMoonChart[date1, date2] \
returns a graphic showing the positions of the four Galilean moons as seen \
from Earth between the dates date1 and date2. The dates are both rounded down \
to the nearest local midnight. The four Galilean moons are Io, Europa, \
Ganymede and Callisto, and they are coloured Black, Red, Green and Blue \
respectively in the graphic. Jupiter is coloured purple, with the width of \
the line corresponding to one Jovian diameter. The white line on top of the \
purple Jovian disk indicates when the Great Red Spot will be visible. (It \
will be visible for half of it's roughly 10 hour rotation period.) The \
horizontal scale is in Jovian radii, and the vertical axis shows time marked \
off in 6 hour interval of local time, along with the day of the month. If \
date2 is omitted then date1 plus four days is used. If date1 is also omitted \
the current Date[] is used."
 
InverseGeod[{x_, 
      y_, z_}] := 
    N[({ArcTan[x, y], 
        ArcSin[z/Sqrt[x^2 + 
            y^2 + z^2]]}*180)/Pi]
 
InverseGeod /: InverseGeod::trace = ""
 
Vega = Alpha . Lyra
 
Vega /: Vega::usage = "Vega = Alpha.Lyra;  Magnitude = 0.03"
 
RigilKent = Alpha . Centaurus
 
RigilKent /: RigilKent::usage = 
     "RigilKent = Alpha.Centaurus;  Magnitude = -0.29 (double)"
 
Antares = Alpha . Scorpius
 
Antares /: Antares::usage = 
     "Antares = Alpha.Scorpius;  Magnitude = 0.96 (variable)"
 
Procyon = Alpha . CanisMinor
 
Procyon /: Procyon::usage = "Procyon = Alpha.CanisMinor;  Magnitude = 0.38"
 
Gacrux = Gamma . Crux
 
Gacrux /: Gacrux::usage = "Gacrux = Gamma.Crux;  Magnitude = 1.63"
 
Rigel = Beta . Orion
 
Rigel /: Rigel::usage = "Rigel = Beta.Orion;  Magnitude = 0.12"
 
Arcturus = Alpha . Bootes
 
Arcturus /: Arcturus::usage = "Arcturus = Alpha.Bootes;  Magnitude = -0.01"
 
Altair = Alpha . Aquila
 
Altair /: Altair::usage = "Altair = Alpha.Aquila;  Magnitude = 0.77"
 
Acrux = Alpha . Crux
 
Acrux /: Acrux::usage = "Acrux = Alpha.Crux;  Magnitude = 0.83 (double)"
 
Spica = Alpha . Virgo
 
Spica /: Spica::usage = "Spica = Alpha.Virgo;  Magnitude = 0.98 (variable)"
 
Bellatrix = Gamma . Orion
 
Bellatrix /: Bellatrix::usage = "Bellatrix = Gamma.Orion;  Magnitude = 1.64"
 
Capella = Alpha . Auriga
 
Capella /: Capella::usage = "Capella = Alpha.Auriga;  Magnitude = 0.08"
 
Sirius = Alpha . CanisMajor
 
Sirius /: Sirius::usage = "Sirius = Alpha.CanisMajor;  Magnitude = -1.46"
 
Deneb = Alpha . Cygnus
 
Deneb /: Deneb::usage = "Deneb = Alpha.Cygnus;  Magnitude = 1.25"
 
Adhara = Epsilon . CanisMajor
 
Adhara /: Adhara::usage = "Adhara = Epsilon.CanisMajor;  Magnitude = 1.50"
 
Achernar = Alpha . Eridanus
 
Achernar /: Achernar::usage = "Achernar = Alpha.Eridanus;  Magnitude = 0.46"
 
Fomalhaut = Alpha . PiscisAustrinus
 
Fomalhaut /: Fomalhaut::usage = 
     "Fomalhaut = Alpha.PiscisAustrinus;  Magnitude = 1.16"
 
Pollux = Beta . Gemini
 
Pollux /: Pollux::usage = "Pollux = Beta.Gemini;  Magnitude = 1.14"
 
Polaris = Alpha . UrsaMinor
 
Polaris /: Polaris::usage = "Polaris = Alpha.UrsaMinor; Magnitude = 2.02"
 
Betelgeuse = Alpha . Orion
 
Betelgeuse /: Betelgeuse::usage = 
     "Betelgeuse = Alpha.Orion;  Magnitude = 0.50 (variable)"
 
Aldebaran = Alpha . Taurus
 
Aldebaran /: Aldebaran::usage = "Aldebaran = Alpha.Taurus;  Magnitude = 0.85"
 
Castor = Alpha . Gemini
 
Castor /: Castor::usage = "Castor = Alpha.Gemini;  Magnitude = 1.59"
 
Becrux = Beta . Crux
 
Becrux /: Becrux::usage = "Becrux = Beta.Crux;  Magnitude = 1.25 (variable)"
 
Regulus = Alpha . Leo
 
Regulus /: Regulus::usage = "Regulus = Alpha.Leo;  Magnitude = 1.35"
 
Agena = Beta . Centaurus
 
Agena /: Agena::usage = "Agena = Beta.Centaurus;  Magnitude = 0.61"
 
Canopus = Alpha . Carina
 
Canopus /: Canopus::usage = "Canopus = Alpha.Carina;  Magnitude = -0.72"
 
$JupiterWhiteSpotBCLongitude = 2.9670597283903604
 
$JupiterWhiteSpotBCLongitude /: $JupiterWhiteSpotBCLongitude::usage = "$Jupit\
erWhiteSpotBCLongitude represents the current Jovian longitude of the White \
Spot named BC. The White Spot BC stays roughly fixed in the System II \
coordinate system of Jupiter, but over the years it does slowly drift. Apart \
from that drift the Spot moves around Jupiter about once every 9hours \
55minutes. The default is 170*Degree, which is the longitude of the Spot in \
June 1994. By July 1994 it was at 149*Degree."
 
$JupiterWhiteSpotDELongitude = 3.2288591161895095
 
$JupiterWhiteSpotDELongitude /: $JupiterWhiteSpotDELongitude::usage = "$Jupit\
erWhiteSpotDELongitude represents the current Jovian longitude of the White \
Spot named DE. The White Spot DE stays roughly fixed in the System II \
coordinate system of Jupiter, but over the years it does slowly drift. Apart \
from that drift the Spot moves around Jupiter about once every 9hours \
55minutes. The default is 185*Degree, which is the longitude of the Spot in \
June 1994. By July 1994 it was at 167*Degree."
 
$JupiterGreatRedSpotLongitude = 0.6981317007977318
 
$JupiterGreatRedSpotLongitude /: $JupiterGreatRedSpotLongitude::usage = "$Jup\
iterGreatRedSpotLongitude represents the current Jovian longitude of the \
Great Red Spot. The Great Red Spot stays roughly fixed in the System II \
coordinate system of Jupiter, but over the years it does slowly drift. Apart \
from that drift the Spot moves around Jupiter about once every 9hours \
55minutes. Here are some values for $JupiterGreatRedSpotLongitude: 45*Degree \
(* June 1990 *), 33*Degree (* June 1992 *), 40*Degree (* June 1994 *), \
41*Degree (* July 1994 *). The default is 40*Degree."
 
$JupiterWhiteSpotFALongitude = 4.4156830075456535
 
$JupiterWhiteSpotFALongitude /: $JupiterWhiteSpotFALongitude::usage = "$Jupit\
erWhiteSpotFALongitude represents the current Jovian longitude of the White \
Spot named FA. The White Spot FA stays roughly fixed in the System II \
coordinate system of Jupiter, but over the years it does slowly drift. Apart \
from that drift the Spot moves around Jupiter about once every 9hours \
55minutes. The default is 253*Degree, which is the longitude of the Spot in \
June 1994. By July 1994 it was at 226*Degree."
 
SectorN /: SectorN::usage = "SectorN is a region that can be used in \
StarChart. It covers the region 0h to 24h of Ascension and +45 to +90 degrees \
of Declination."
 
SectorS /: SectorS::usage = "SectorS is a region that can be used in \
StarChart. It covers the region 0h to 24h of Ascension and -45 to -90 degrees \
of Declination."
 
Sector3 /: Sector3::usage = "Sector3 is a region that can be used in \
StarChart. It covers the region 8h to 12h of Ascension and -45 to +45 degrees \
of Declination."
 
Sector2 /: Sector2::usage = "Sector2 is a region that can be used in \
StarChart. It covers the region 4h to 8h of Ascension and -45 to +45 degrees \
of Declination."
 
Sector1 /: Sector1::usage = "Sector1 is a region that can be used in \
StarChart. It covers the region 0h to 4h of Ascension and -45 to +45 degrees \
of Declination."
 
Sector6 /: Sector6::usage = "Sector6 is a region that can be used in \
StarChart. It covers the region 20h to 24h of Ascension and -45 to +45 \
degrees of Declination."
 
Sector5 /: Sector5::usage = "Sector5 is a region that can be used in \
StarChart. It covers the region 16h to 20h of Ascension and -45 to +45 \
degrees of Declination."
 
Sector4 /: Sector4::usage = "Sector4 is a region that can be used in \
StarChart. It covers the region 12h to 16h of Ascension and -45 to +45 \
degrees of Declination."
