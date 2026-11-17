"""Regenerate the vector figures (requires matplotlib and numpy)."""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

OUTPUT = Path(__file__).parent
INK = "#172939"
TEAL = "#126963"
RUST = "#a24d31"
GREY = "#537085"

plt.rcParams.update({
    "font.size": 10,
    "font.family": "DejaVu Sans",
    "text.color": INK,
    "axes.labelcolor": INK,
    "axes.edgecolor": GREY,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "axes.grid": True,
    "grid.color": "#dce7e5",
    "grid.linewidth": 0.6,
    "axes.axisbelow": True,
    "svg.hashsalt": "math210-unit01",
})


def make_axes(xlabel, ylabel, height=2.25):
    fig, ax = plt.subplots(figsize=(6.0, height), layout="constrained")
    ax.set(xlabel=xlabel, ylabel=ylabel)
    return fig, ax


def save(fig, name):
    fig.savefig(OUTPUT / f"{name}.svg", metadata={"Date": None})
    plt.close(fig)


t = np.linspace(0, 14, 360)
fig, ax = make_axes("", "", height=2.35)
ax.axhline(0, color="#c8d9d7", linewidth=0.8)
for rate, color, style in [(0, TEAL, "-"), (-0.19, GREY, "--"), (0.04, RUST, ":")]:
    ax.plot(t, np.exp(rate * t) * np.sin(2 * t), color=color, linestyle=style, linewidth=1.9)
ax.set_axis_off()
save(fig, "cover")

t = np.linspace(0, 25, 240)
fig, ax = make_axes("Time (min)", "Temperature (°C)")
ax.plot(t, 20 + 60 * np.exp(-0.12 * t), color=TEAL, linewidth=2)
ax.axhline(20, color=GREY, linestyle="--", label="Room temperature")
ax.legend(frameon=False)
save(fig, "cooling")

t = np.linspace(0, 5, 250)
fig, ax = make_axes("Time (h)", "Population (cells)")
for initial, color, style in [(20, TEAL, "-"), (60, GREY, "--"), (160, RUST, "-.")]:
    y = 100 / (1 + (100 / initial - 1) * np.exp(-t))
    ax.plot(t, y, color=color, linestyle=style, linewidth=2, label=f"P(0) = {initial}")
ax.axhline(100, color=INK, linestyle=":", label="P = 100")
ax.legend(frameon=False, ncols=2)
save(fig, "logistic")

x, y = np.meshgrid(np.linspace(0, 3, 17), np.linspace(-1, 3.2, 17))
slope = x - y
dx = 0.15 / np.sqrt(1 + slope**2)
dy = dx * slope
fig, ax = make_axes("t", "y", height=2.5)
ax.quiver(x, y, dx, dy, color="#698490", angles="xy", scale_units="xy", scale=1,
          pivot="middle", headwidth=0, headlength=0, headaxislength=0, width=0.0025)
t = np.linspace(0, 3, 160)
ax.plot(t, t, color=RUST, linestyle="--", label="Zero-slope line")
for initial, style in [(0, "-"), (1.7, "-.")]:
    ax.plot(t, t - 1 + (initial + 1) * np.exp(-t), color=TEAL, linestyle=style,
            linewidth=1.8, label=f"y(0) = {initial}")
ax.set(xlim=(-0.1, 3.1), ylim=(-1.1, 3.3))
ax.legend(frameon=False, loc="upper left")
save(fig, "direction-field")

fig, ax = make_axes("t", "y")
t = np.linspace(0, 2, 140)
ax.plot(t, np.exp(-t), color=INK, linewidth=1.9, label="Exact")
for h, color, style in [(0.5, RUST, "--"), (0.25, TEAL, "-.")]:
    n = np.arange(round(2 / h) + 1)
    ax.plot(n*h, (1-h)**n, color=color, linestyle=style, marker="o", markersize=3.2,
            label=f"Euler, h = {h}")
ax.legend(frameon=False)
save(fig, "euler")

fig, ax = make_axes("t", "Displacement")
t = np.linspace(0, 6, 300)
ax.plot(t, np.exp(-t)*(np.cos(3*t)+np.sin(3*t)/3), color=TEAL, linewidth=1.9, label="Underdamped")
ax.plot(t, (1+2*t)*np.exp(-2*t), color=RUST, linestyle="--", label="Critical")
ax.plot(t, (3*np.exp(-t)-np.exp(-3*t))/2, color=GREY, linestyle="-.", label="Overdamped")
ax.legend(frameon=False)
save(fig, "damping")

fig, ax = make_axes("t", "Displacement", height=2.4)
t = np.linspace(0, 14, 400)
ax.plot(t, t*np.sin(2*t)/4, color=TEAL, label="Resonant response")
ax.plot(t, t/4, color=RUST, linestyle="--", label="Envelope ±t/4")
ax.plot(t, -t/4, color=RUST, linestyle="--")
ax.legend(frameon=False)
save(fig, "resonance")
