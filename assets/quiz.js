(() => {
  function evaluate(option) {
    const quiz = option.closest(".quiz");
    if (!quiz || option.disabled) return;

    const options = Array.from(quiz.querySelectorAll(".quiz-option"));
    const correctOption = quiz.querySelector('.quiz-option[data-correct="true"]');
    const correct = option.dataset.correct === "true";

    options.forEach((item) => {
      item.disabled = true;
    });

    option.classList.add(correct ? "correct" : "wrong");
    if (!correct && correctOption) {
      correctOption.classList.add("correct");
    }

    const feedback = quiz.querySelector(".quiz-feedback");
    if (feedback) {
      feedback.textContent = option.dataset.feedback || (correct ? "✓ Correct!" : "✗ Try again.");
      feedback.classList.add("show");
    }
  }

  document.addEventListener("click", (event) => {
    if (!(event.target instanceof Element)) return;
    const option = event.target.closest(".quiz-option");
    if (option) evaluate(option);
  });
})();
