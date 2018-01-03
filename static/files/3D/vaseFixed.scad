/* [Global] */
nFaces = 5; // [1:10]

radius1 = 100; // [10:200]
radius2 = 100; // [10:200]
radius3 = 100; // [10:200]
radius4 = 100; // [10:200]
radius5 = 100; // [10:200]
radius6 = 100; // [10:200]
radius7 = 100; // [10:200]
radius8 = 100; // [10:200]
radius9 = 100; // [10:200]
radius10 = 100; // [10:200]

offset1 = 0; // [0:1]
offset2 = 0.5; // [0:1]
offset3 = 0.2; // [0:1]
offset4 = 0.7; // [0:1]
offset5 = 0.4; // [0:1]
offset6 = 0.9; // [0:1]
offset7 = 0.6; // [0:1]
offset8 = 0.1; // [0:1]
offset9 = 0.8; // [0:1]
offset10 = 0.3; // [0:1]

nLayers = 5; // [1:9]

height = 200;


/* [Hidden] */

step = 360/nFaces;

stepZ = height/nLayers;

radii = [radius1, radius2, radius3, radius4, radius5, radius6, radius7, radius8, radius9, radius10];
offsets = [offset1, offset2, offset3, offset4, offset5, offset6, offset7, offset8, offset9, offset10];

// --- Utils --- //

// compute sum of vector from i to s
function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));

// flatten vector
function flatten(l) = [ for (a = l) for (b = a) b ] ;

// invert triangle
function invertTriangle(t) = [ t[0], t[2], t[1]  ] ;

// invert triangles
function invertTriangles(triangles) = [ for(t=triangles) invertTriangle(t)] ;
    
// --- Compute points of a polygon / circle --- //

function points(step, radius, z, offset) = [ for (i = [0 : step : 360-step])[radius*cos(i+offset),radius*sin(i+offset),z]];

// --- Compute all points --- //

// for each layer : compute a list of points
layerPoints = [ for (i = [0 : nLayers]) let ( r = radii[i], faceSize = 2*r*sin(step)) points(step, r, i*height/nLayers, step*offsets[i]) ];

// flatten the list of points for each layers
p = flatten(layerPoints);

// --- Create layers --- //

// for each layer : 

//  bottom faces
function faces1(nFaces, layerIndex, offset) = [ for (i = [0 : nFaces-1])[i+layerIndex*nFaces,i < nFaces-1 ?  nFaces+i+offset+layerIndex*nFaces : nFaces+(1-offset)*(nFaces-1)+layerIndex*nFaces,i < nFaces-1 ? i+1+layerIndex*nFaces : 0+layerIndex*nFaces]];

// top faces
function faces2(nFaces, layerIndex, offset) = [ for (i = [0 : nFaces-1])[nFaces+i+layerIndex*nFaces, i < nFaces-1 ? nFaces+i+1+layerIndex*nFaces : nFaces+layerIndex*nFaces, i < nFaces-1 ? i+1-offset+layerIndex*nFaces : 0+offset*(nFaces-1)+layerIndex*nFaces]];

// contact bottom faces and top faces
function faces(nFaces, layerIndex, offset) = concat(faces1(nFaces, layerIndex, offset), faces2(nFaces, layerIndex, offset));

// create face indices (invert faces)
layerFaces = [ for (i = [0 : nLayers-1]) invertTriangles(faces(nFaces, i, i%2 == 0 ? 0 : 1)) ];

// flatten faces indices
f = flatten(layerFaces);

// create layer faces
polyhedron( points = p, faces = f, convexity = 1);

// --- Create top and bottom faces --- //

// create bottom center
p1 = concat(p, [[0, 0, 0]]);
bottomIndex = len(p1)-1;

// create top center
p2 = concat(p1, [[0, 0, height]]);
topIndex = len(p2)-1;

bottomFace = [for (i = [0 : nFaces-1]) [i, i < nFaces-1 ? i+1 : 0, bottomIndex] ];
polyhedron( points = p2, faces = bottomFace, convexity = 1);

topFace = [for (i = [0 : nFaces-1]) invertTriangle([i+nLayers*nFaces, i < nFaces-1 ? i+1+nLayers*nFaces : 0+nLayers*nFaces, topIndex]) ];
polyhedron( points = p2, faces = topFace, convexity = 1);
