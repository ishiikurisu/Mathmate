function test_dropbox
stuff = dropbox;
for x = 0:0.4:10
  stuff.addIra(x);
  stuff.addScore(10*x + 5);
end
stuff.IRAs
stuff.Scores
stuff.calculateCorrelation
