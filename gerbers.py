# This script uses the pcbnew SWIG bindings to generate gerber plots from
# the current kicad_pcb file.

import sys
from pcbnew import *

filename = sys.argv[1]
board = LoadBoard(filename)

pctl = PLOT_CONTROLLER(board)

popt = pctl.GetPlotOptions()
popt.SetOutputDirectory("gerbers/")
popt.SetPlotFrameRef(False)
popt.SetLineWidth(FromMM(0.35))
popt.SetAutoScale(False)
popt.SetScale(1)
popt.SetMirror(False)
popt.SetUseGerberAttributes(True)
popt.SetExcludeEdgeLayer(False)
popt.SetScale(1)
popt.SetUseAuxOrigin(True)
popt.SetSubtractMaskFromSilk(False)
popt.SetUseGerberProtelExtensions(True)

plot_plan = [
    ("CuTop", F_Cu, "Top layer"),
    ("CuBottom", B_Cu, "Bottom layer"),
    ("SilkTop", F_SilkS, "Silk top"),
    ("SilkBottom", B_SilkS, "Silk top"),
    ("MaskBottom", B_Mask, "Mask bottom"),
    ("MaskTop", F_Mask, "Mask top"),
    ("EdgeCuts", Edge_Cuts, "Edges"),
]

for layer_info in plot_plan:
    pctl.SetLayer(layer_info[1])
    pctl.OpenPlotfile(layer_info[0], PLOT_FORMAT_GERBER, layer_info[2])
    pctl.PlotLayer()

ewr = EXCELLON_WRITER(board)
ewr.SetFormat(False)  # Don't use metric (i.e. use imperial)
ewr.CreateDrillandMapFilesSet("gerbers", True, False)
