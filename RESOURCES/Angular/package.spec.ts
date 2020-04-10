// Test if all package.json files are in sync
// ----------------------------------------------------------------------------

// Import dependencies
const path = require('path'),
      fs   = require('fs');

// Run tests async
(async () => {

  // Read main package.json
  const packageJsonMain = JSON.parse(fs.readFileSync(path.join(__dirname, './package.json')));

  // Find all other instances of package.json
  const packageJsonPaths = (function findFiles (dir, matcherFn, aggregator = []) {
    const paths = fs.readdirSync(dir);
    for (const name of paths) {
      const fullname = path.join(dir, name),
            stat     = fs.lstatSync(fullname);
      if (stat.isDirectory()) {
        findFiles(fullname, matcherFn, aggregator);
      } else if (matcherFn(name)) {
        aggregator.push(fullname.trim());
      }
    }
    return aggregator;
  })(
    path.join(__dirname, './projects'),
    (filename) => (filename === 'package.json')
  );

  // Check if package.json is in sync across the project
  describe('package.json synced', () => {

    for (const packageJsonNestedPath of packageJsonPaths) {

      // Read nested package.json
      const packageJsonNested = JSON.parse(fs.readFileSync(packageJsonNestedPath));

      // Test nested package.json
      describe(`... with "${packageJsonNestedPath}"`, () => {

        // Check package version
        it('Matches version', () => {
          expect(packageJsonMain.version === packageJsonNested.version).toBeTruthy();
        });

        // Check package name
        it('Matches name', () => {
          expect(packageJsonMain.name === packageJsonNested.name).toBeTruthy();
        });

        // Check package description
        it('Matches description', () => {
          expect(packageJsonMain.description === packageJsonNested.description).toBeTruthy();
        });

        // Check package author
        it('Matches author', () => {
          expect(packageJsonMain.author === packageJsonNested.author).toBeTruthy();
        });

        // Check package license
        it('Matches license', () => {
          expect(packageJsonMain.license === packageJsonNested.license).toBeTruthy();
        });

        // Check package repository
        it('Matches repository', () => {
          expect(JSON.stringify(packageJsonMain.repository) === JSON.stringify(packageJsonNested.repository)).toBeTruthy();
        });

        // Check package keywords
        it('Matches keywords', () => {
          expect(JSON.stringify(packageJsonMain.keywords) === JSON.stringify(packageJsonNested.keywords)).toBeTruthy();
        });

        // Check package dependency versions
        describe('Matches dependency versions', () => {
          // Check primary dependencies
          if (packageJsonNested.dependencies) {
            for (const key of Object.keys(packageJsonNested.dependencies)) {
              it(`Matches ${key} version ${packageJsonNested.dependencies[key]}`, () => {
                if (packageJsonMain.dependencies && packageJsonMain.dependencies[key]) {
                  expect(packageJsonNested.dependencies[key] === packageJsonMain.dependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.devDependencies && packageJsonMain.devDependencies[key]) {
                  expect(packageJsonNested.dependencies[key] === packageJsonMain.devDependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.peerDependencies && packageJsonMain.peerDependencies[key]) {
                  expect(packageJsonNested.dependencies[key] === packageJsonMain.peerDependencies[key]).toBeTruthy();
                }
              });
            }
          }
          // Check dev dependencies
          if (packageJsonNested.devDependencies) {
            for (const key of Object.keys(packageJsonNested.devDependencies)) {
              it(`Matches ${key} version ${packageJsonNested.devDependencies[key]}`, () => {
                if (packageJsonMain.dependencies && packageJsonMain.dependencies[key]) {
                  expect(packageJsonNested.devDependencies[key] === packageJsonMain.dependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.devDependencies && packageJsonMain.devDependencies[key]) {
                  expect(packageJsonNested.devDependencies[key] === packageJsonMain.devDependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.peerDependencies && packageJsonMain.peerDependencies[key]) {
                  expect(packageJsonNested.devDependencies[key] === packageJsonMain.peerDependencies[key]).toBeTruthy();
                }
              });
            }
          }
          // Check peer dependencies
          if (packageJsonNested.peerDependencies) {
            for (const key of Object.keys(packageJsonNested.peerDependencies)) {
              it(`Matches ${key} version ${packageJsonNested.peerDependencies[key]}`, () => {
                if (packageJsonMain.dependencies && packageJsonMain.dependencies[key]) {
                  expect(packageJsonNested.peerDependencies[key] === packageJsonMain.dependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.devDependencies && packageJsonMain.devDependencies[key]) {
                  expect(packageJsonNested.peerDependencies[key] === packageJsonMain.devDependencies[key]).toBeTruthy();
                }
                if (packageJsonMain.peerDependencies && packageJsonMain.peerDependencies[key]) {
                  expect(packageJsonNested.peerDependencies[key] === packageJsonMain.peerDependencies[key]).toBeTruthy();
                }
              });
            }
          }
        });

      });
    }

  });

})();
