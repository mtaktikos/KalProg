#!/usr/bin/env wolframscript
(*
  Script to generate Chronometry.pdf from Chronometry_EN.nb
  Usage: wolframscript generate_pdf.wls
  Or: chmod +x generate_pdf.wls && ./generate_pdf.wls
*)

Print["Opening Chronometry_EN.nb..."];
nb = NotebookOpen["Chronometry_EN.nb"];

Print["Exporting to Chronometry.pdf..."];
Export["Chronometry.pdf", nb];

Print["Closing notebook..."];
NotebookClose[nb];

Print["✓ Done! Chronometry.pdf has been created."];
Print["Please verify the PDF and commit it to the repository."];
