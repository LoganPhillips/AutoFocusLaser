import numpy as np
from matplotlib import pyplot as plt
import matplotlib.animation as animation
import time


def GetSpot(BeamRadius,Mean):
    RandScale=.01
    Window=10
    Dim=100
    x, y = np.meshgrid(np.linspace(-Window,Window,Dim), np.linspace(-Window,Window,Dim))
    d = np.sqrt(x*x+y*y)
    sigma, mu = BeamRadius, Mean
    Spot = np.exp(-( (d-mu)**2 / ( 2.0 * sigma**2 ) ) )
    Spot+=RandScale*np.random.rand(Dim,Dim)-RandScale/2
    return Spot

def PressureCell(t):
    RandScale=.1
    Amp=10
    freq=1
    Lpc=Amp*np.sin(freq*t)+RandScale*np.random.rand()-RandScale/2 #Effective pathlenght of pressure cell
    return Lpc

def BeamRadius(R0,FL,L,t):
    L+=PressureCell(t)
    R1=(L-FL)*R0/FL
    return R1



R0=6
FL=1
L=.5
t=.8
R1=BeamRadius(R0,FL,L,t)
Spot=GetSpot(R1,0)
plt.imshow(Spot)

