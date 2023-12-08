import("stdfaust.lib");

freq = hslider("freq",20,20,20000,1);

process = os.oscsin(freq);
