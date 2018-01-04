/* [Global] */
nFaces = 6; // [1:100]
bottomRadius = 100; // [10:200]
topRadius = 70;
height = 200;

/* [Hidden] */
step = 360/nFaces;
faceSize = (topRadius+bottomRadius)*sin(step);
nLayers = 2+4*floor(height / faceSize);

stepZ = height/nLayers;
deltaRadius = topRadius - bottomRadius;

function points(step, radius, z, offset) = [ for (i = [0 : step : 360-step])[radius*cos(i+offset),radius*sin(i+offset),z]];

function computeHeights() = [ for(i=[0:nLayers]) let ( r = bottomRadius+(i/nLayers)*deltaRadius, faceSize = 2*r*sin(step/2)) faceSize*sqrt(3)/4 ];

function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));

function computeHeights2(heights) = [ for(i=[0:nLayers]) sumv(heights, i, 0) ];
    
h = computeHeights();
h2 = computeHeights2(h);
echo(nLayers);
echo(h);
echo(h2);

layerPoints = [ for (i = [0 : nLayers]) let ( r = bottomRadius+(i/nLayers)*deltaRadius, faceSize = 2*r*sin(step)) points(step, r, i==0 ? 0 : h2[i-1], i%2 == 0 ? 0 : step/2) ];
    

function flatten(l) = [ for (a = l) for (b = a) b ] ;

p = flatten(layerPoints);
    
//triangles = [ for (i = [0 : nFaces])[i,i+1,nFaces]];
//points2 = concat(points, [[0, 0, 0]]); 
//echo(points2);

fa = [[ for (i = [0 : nFaces-1])i]];
polyhedron( points = p, faces = fa, convexity = 1);
fa2 = [[ for (i = [0 : nFaces-1]) nFaces-1-i+nLayers*nFaces ]];
polyhedron( points = p, faces = fa2, convexity = 1);

// points2 = [ for (i = [0 : step : 360-step])[radius*cos(i+step/2),radius*sin(i+step/2),stepZ]];

function faces1(nFaces, layerIndex, offset) = [ for (i = [0 : nFaces-1])[i+layerIndex*nFaces,i < nFaces-1 ?  nFaces+i+offset+layerIndex*nFaces : nFaces+(1-offset)*(nFaces-1)+layerIndex*nFaces,i < nFaces-1 ? i+1+layerIndex*nFaces : 0+layerIndex*nFaces]];

function faces2(nFaces, layerIndex, offset) = [ for (i = [0 : nFaces-1])[nFaces+i+layerIndex*nFaces, i < nFaces-1 ? nFaces+i+1+layerIndex*nFaces : nFaces+layerIndex*nFaces, i < nFaces-1 ? i+1-offset+layerIndex*nFaces : 0+offset*(nFaces-1)+layerIndex*nFaces]];

function faces(nFaces, layerIndex, offset) = concat(faces1(nFaces, layerIndex, offset), faces2(nFaces, layerIndex, offset));

layerFaces = [ for (i = [0 : nLayers-1]) faces(nFaces, i, i%2 == 0 ? 0 : 1) ];
echo(layerFaces);
f = flatten(layerFaces);
    
polyhedron( points = p, faces = f, convexity = 1);

