module.exports = {
  testEnvironment: "node",
  verbose: false,
  testPathIgnorePatterns: ['node_moodules', '.cache', 'build', '.generated', 'generators', 'mama'],
  transform: {
    "^.+\\.jsx?$": "babel-jest"
  }
};
