/*
 * Copyright 2020 Andrey Kutejko <andy128k@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 * For more details see the file COPYING.
 */

using Gtk;
using Gdk;
using Cairo;

public class Bubble {
    private Pixbuf pixbuf;

    public int width {
        get { return pixbuf.width / 2; }
    }

    public int height {
        get { return pixbuf.height / 2; }
    }

    public Bubble.from_file (string filename) throws Error {
        pixbuf = new Pixbuf.from_file (filename);
    }

    public Bubble.from_data_file (string filename) throws Error {
        this.from_file (
            GLib.Path.build_filename (DATA_DIRECTORY, "pixmaps", filename)
        );
    }

    public void draw (Context cr, int x, int y) {
        int clip_x = x < width ? x : x - width;
        int clip_y = y < height ? y : y - height;

        cairo_set_source_pixbuf (cr, pixbuf, x - width, y - height);
        cr.rectangle (clip_x, clip_y, width, height);
        cr.fill ();
    }
}
