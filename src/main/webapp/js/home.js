// Script para controlar o menu hambúrguer
document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.querySelector(".menu-toggle");
  const menuLinks = document.querySelector(".menu-links");

  menuToggle.addEventListener("click", () => {
    menuLinks.classList.toggle("open");
  });
});

const carousel = document.querySelector('.carousel-inner');
const items = document.querySelectorAll('.carousel-item');
const prevButton = document.querySelector('.carousel-control.prev');
const nextButton = document.querySelector('.carousel-control.next');
let currentIndex = 0;

function updateCarousel() {
  items.forEach((item, index) => {
    item.classList.remove('active');
    if (index === currentIndex) {
      item.classList.add('active');
    }
  });
}

prevButton.addEventListener('click', () => {
  currentIndex = (currentIndex === 0) ? items.length - 1 : currentIndex - 1;
  updateCarousel();
});

nextButton.addEventListener('click', () => {
  currentIndex = (currentIndex === items.length - 1) ? 0 : currentIndex + 1;
  updateCarousel();
});


updateCarousel();

const itemsPerPage = 4;
const itemsPerPage1 = 4;
const itemsPerPage2 = 4;
const boxCarousel = document.querySelector('.box-carousel-1');
const boxCarousel1 = document.querySelector('.box-carousel-2');
const boxCarousel2 = document.querySelector('.box-carousel-3');
const perfumes = Array.from(boxCarousel.children);
const perfumes1 = Array.from(boxCarousel1.children);
const perfumes2 = Array.from(boxCarousel2.children);
const pagination = document.querySelector('.pagination');
const pagination1 = document.querySelector('.pagination-1');
const pagination2 = document.querySelector('.pagination-2');

let currentPage = 1;
let currentPage1 = 1;
let currentPage2 = 1;

////////////////////////////////////////////
////////////////////////////////////////////

// Função para renderizar a página
function renderPage(page) {
  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;

  perfumes.forEach((item, index) => {
    if (index >= start && index < end) {
      item.style.display = 'flex';
    } else {
      item.style.display = 'none';
    }
  });

  updatePagination();
}

// Função para atualizar os botões de paginação
function updatePagination() {
  const totalPages = Math.ceil(perfumes.length / itemsPerPage);
  pagination.innerHTML = '';

  for (let i = 1; i <= totalPages; i++) {
    const button = document.createElement('button');
    button.textContent = i;
    button.classList.toggle('active', i === currentPage);
    button.addEventListener('click', () => {
      currentPage = i;
      renderPage(currentPage);
    });
    pagination.appendChild(button);
  }
}
// Inicialize a exibição
renderPage(currentPage);

////////////////////////////////////////////
////////////////////////////////////////////



// Função para renderizar a página
function renderPage1(page1) {
  const start = (page1 - 1) * itemsPerPage1;
  const end = start + itemsPerPage1;

  perfumes1.forEach((item, index) => {
    if (index >= start && index < end) {
      item.style.display = 'flex';
    } else {
      item.style.display = 'none';
    }
  });

  updatePagination1();
}
function updatePagination1() {
  const totalPages = Math.ceil(perfumes1.length / itemsPerPage1);
  pagination1.innerHTML = '';

  for (let i = 1; i <= totalPages; i++) {
    const button = document.createElement('button');
    button.textContent = i;
    button.classList.toggle('active', i === currentPage1);
    button.addEventListener('click', () => {
      currentPage1 = i;
      renderPage1(currentPage1);
    });
    pagination1.appendChild(button);
  }
}
// Inicialize a exibição
renderPage1(currentPage1);


////////////////////////////////////////////
////////////////////////////////////////////

// Função para renderizar a página
function renderPage2(page2) {
  const start = (page2 - 1) * itemsPerPage2;
  const end = start + itemsPerPage2;

  perfumes2.forEach((item, index) => {
    if (index >= start && index < end) {
      item.style.display = 'flex';
    } else {
      item.style.display = 'none';
    }
  });

  updatePagination2();
}
function updatePagination2() {
  const totalPages = Math.ceil(perfumes2.length / itemsPerPage2);
  pagination2.innerHTML = '';

  for (let i = 1; i <= totalPages; i++) {
    const button = document.createElement('button');
    button.textContent = i;
    button.classList.toggle('active', i === currentPage2);
    button.addEventListener('click', () => {
      currentPage2 = i;
      renderPage2(currentPage2);
    });
    pagination2.appendChild(button);
  }
}

// Inicialize a exibição
renderPage2(currentPage2);