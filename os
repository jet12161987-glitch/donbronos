import tkinter as tk
from tkinter import messagebox
import time

# 1. Initialize the Desktop Environment
desktop = tk.Tk()
desktop.title("Custom Windows OS")
desktop.geometry("900x650")
desktop.configure(bg="#008080") # Teal/Cyan color of classic Windows 95/98

# 2. Clock Update Function for the System Tray
def update_clock():
    current_time = time.strftime("%I:%M %p")
    clock_label.config(text=current_time)
    clock_label.after(1000, update_clock)

# 3. Action for the Desktop Shortcut Icon
def open_game():
    # This spawns a mini game window when double-clicked!
    game_win = tk.Toplevel(desktop)
    game_win.title("MineSweeper Clone")
    game_win.geometry("200x200")
    game_win.configure(bg="#C0C0C0")
    
    label = tk.Label(game_win, text="💣 MineSweeper 💣", font=("Arial", 12, "bold"), bg="#C0C0C0")
    label.pack(pady=20)
    
    btn = tk.Button(game_win, text="Click to Sweep!", command=lambda: messagebox.showinfo("Boom!", "You won!"))
    btn.pack(pady=10)

# 4. Create a Clickable Desktop Shortcut Icon
icon_frame = tk.Frame(desktop, bg="#008080")
icon_frame.place(x=30, y=30)

# Simple representation of a game controller emoji as an icon
icon_visual = tk.Label(icon_frame, text="🎮", font=("Arial", 24), bg="#008080", fg="white")
icon_visual.pack()

icon_text = tk.Label(icon_frame, text="My Game", font=("Arial", 10), bg="#008080", fg="white")
icon_text.pack()

# Bind a double-click to launch the game window
icon_visual.bind("<Double-Button-1>", lambda e: open_game())
icon_text.bind("<Double-Button-1>", lambda e: open_game())

# 5. Create the Bottom Taskbar
taskbar = tk.Frame(desktop, bg="#C0C0C0", height=40, bd=2, relief="raised")
taskbar.pack(fill="x", side="bottom")

# Green Windows Start Button
def click_start():
    messagebox.showinfo("Start Menu", "Programs:\n- My Game (Double-click on desktop)\n- AI Terminal (Coming soon)")

start_button = tk.Button(taskbar, text="🟢 Start", bg="#008000", fg="white", font=("Arial", 10, "bold"), command=click_start)
start_button.pack(side="left", padx=5, py=5)

# System Tray (Right side of Taskbar for the clock)
tray = tk.Frame(taskbar, bg="#E0E0E0", bd=2, relief="sunken")
tray.pack(side="right", padx=5, py=5, fill="y")

clock_label = tk.Label(tray, text="", font=("Arial", 10), bg="#E0E0E0", fg="black")
clock_label.pack(padx=10, fill="y")
