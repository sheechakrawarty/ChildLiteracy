const wheel = document.getElementById("wheel");
const spinBtn = document.getElementById("spin-btn");
const finalValue = document.getElementById("final-value");

// Object that stores values of minimum and maximum angle for a value
const rotationValues = [
  { minDegree: 0, maxDegree: 30, value: "Right to Equality" },
  { minDegree: 31, maxDegree: 90, value: "Right to Freedom" },
  { minDegree: 91, maxDegree: 150, value: "Right against Exploitation" },
  { minDegree: 151, maxDegree: 210, value: "Right to Freedom of Religion" },
  { minDegree: 211, maxDegree: 270, value: "Cultural and Educational Rights" },
  { minDegree: 271, maxDegree: 330, value: "Right to Constitutional Remedies" },
  { minDegree: 331, maxDegree: 360, value: "Right to Equality" },
];

// Information about each constitutional right
const rightsInfo = {
  "Right to Equality": "Ensures equality before the law and prohibits discrimination on grounds of religion, race, caste, sex, or place of birth.",
  "Right to Freedom": "Includes freedom of speech and expression, assembly, association, movement, residence, and the right to practice any profession or occupation.",
  "Right against Exploitation": "Prohibits all forms of forced labor, child labor, and human trafficking.",
  "Right to Freedom of Religion": "Provides religious freedom and ensures the right to practice, profess, and propagate any religion.",
  "Cultural and Educational Rights": "Protects the rights of cultural, religious, and linguistic minorities to preserve their heritage and establish educational institutions.",
  "Right to Constitutional Remedies": "Allows individuals to seek redressal for the violation of their fundamental rights through the courts."
};

// Size of each piece
const data = [16, 16, 16, 16, 16, 16];

// Background color for each piece
var pieColors = [
  "#8b35bc",
  "#b163da",
  "#8b35bc",
  "#b163da",
  "#8b35bc",
  "#b163da",
];

// Create chart
let myChart = new Chart(wheel, {
  // Plugin for displaying text on pie chart
  plugins: [ChartDataLabels],
  // Chart Type Pie
  type: "pie",
  data: {
    // Labels(values which are to be displayed on chart)
    labels: [ "Freedom","Equality","constitution", "Education","Religion","Exploitation"],
    // Settings for dataset/pie
    datasets: [
      {
        backgroundColor: pieColors,
        data: data,
      },
    ],
  },
  options: {
    // Responsive chart
    responsive: true,
    animation: { duration: 0 },
    plugins: {
      // Hide tooltip and legend
      tooltip: false,
      legend: {
        display: false,
      },
      // Display labels inside pie chart
      datalabels: {
        color: "#ffffff",
        formatter: (_, context) => context.chart.data.labels[context.dataIndex],
        font: { size: 16 },
      },
    },
  },
});

// Display value based on the randomAngle
const valueGenerator = (angleValue) => {
  for (let i of rotationValues) {
    // If the angleValue is between min and max then display it
    if (angleValue >= i.minDegree && angleValue <= i.maxDegree) {
      finalValue.innerHTML = `<p>${i.value}: ${rightsInfo[i.value]}</p>`;
      spinBtn.disabled = false;
      break;
    }
  }
};

// Spinner count
let count = 0;
// 100 rotations for animation and last rotation for result
let resultValue = 101;
// Start spinning
spinBtn.addEventListener("click", () => {
  spinBtn.disabled = true;
  // Empty final value
  finalValue.innerHTML = `<p>Good Luck!</p>`;
  // Generate random degrees to stop at
  let randomDegree = Math.floor(Math.random() * (355 - 0 + 1) + 0);
  // Interval for rotation animation
  let rotationInterval = window.setInterval(() => {
    // Set rotation for piechart
    /*
    Initially to make the piechart rotate faster we set resultValue to 101 so it rotates 101 degrees at a time and this reduces by 1 with every count. Eventually on last rotation we rotate by 1 degree at a time.
    */
    myChart.options.rotation = myChart.options.rotation + resultValue;
    // Update chart with new value;
    myChart.update();
    // If rotation>360 reset it back to 0
    if (myChart.options.rotation >= 360) {
      count += 1;
      resultValue -= 5;
      myChart.options.rotation = 0;
    } else if (count > 15 && myChart.options.rotation == randomDegree) {
      valueGenerator(randomDegree);
      clearInterval(rotationInterval);
      count = 0;
      resultValue = 101;
    }
  }, 10);
});
