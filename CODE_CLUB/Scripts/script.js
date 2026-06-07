

document.addEventListener('DOMContentLoaded', function () {

   
    var sidebar = document.getElementById('sidebar');
    var menuToggle = document.getElementById('menuToggle');

    if (menuToggle) {
        menuToggle.addEventListener('click', function () {
            sidebar.classList.toggle('open');
            menuToggle.classList.toggle('open');
        });
    }

    document.querySelectorAll('.nav-link').forEach(function (link) {
        link.addEventListener('click', function () {
            if (window.innerWidth <= 900) {
                sidebar.classList.remove('open');
                if (menuToggle) menuToggle.classList.remove('open');
            }
        });
    });

   
    var path = window.location.pathname.toLowerCase();
    document.querySelectorAll('.nav-link').forEach(function (link) {
        var href = (link.getAttribute('href') || '').toLowerCase();
        if (href && path.indexOf(href.replace('~/', '').replace('.aspx', '')) !== -1) {
            link.classList.add('active');
        }
    });

    var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.12 });

    document.querySelectorAll('.reveal').forEach(function (el) {
        observer.observe(el);
    });

   
    function animateCounter(el, target) {
        var start = null;
        var duration = 1800;
        function step(ts) {
            if (!start) start = ts;
            var progress = Math.min((ts - start) / duration, 1);
            var ease = 1 - Math.pow(1 - progress, 4);
            el.textContent = Math.floor(ease * target) + (progress < 1 ? '' : '+');
            if (progress < 1) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    var statNums = document.querySelectorAll('.stat-num');
    if (statNums.length) {
        var counterObs = new IntersectionObserver(function (entries) {
            if (entries[0].isIntersecting) {
                statNums.forEach(function (el) {
                    animateCounter(el, parseInt(el.dataset.target, 10));
                });
                counterObs.disconnect();
            }
        }, { threshold: 0.5 });
        var hero = document.querySelector('.hero-section');
        if (hero) counterObs.observe(hero);
    }

   
    var rainContainer = document.getElementById('codeRain');
    if (rainContainer) {
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        rainContainer.appendChild(canvas);

        function resize() {
            canvas.width = rainContainer.offsetWidth;
            canvas.height = rainContainer.offsetHeight;
        }
        resize();
        window.addEventListener('resize', resize);

        var chars = '01{}[]()<>=!+-*/&|^~#$%@?;:'.split('');
        var cols = Math.floor(canvas.width / 16);
        var drops = [];
        for (var i = 0; i < cols; i++) drops[i] = 1;

        setInterval(function () {
            ctx.fillStyle = 'rgba(10,10,15,0.12)';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = '#00e5ff';
            ctx.font = '13px monospace';
            drops.forEach(function (y, i) {
                var ch = chars[Math.floor(Math.random() * chars.length)];
                ctx.fillText(ch, i * 16, y * 16);
                if (y * 16 > canvas.height && Math.random() > 0.97) drops[i] = 0;
                drops[i]++;
            });
        }, 55);
    }

   
    var stars = document.querySelectorAll('.star');
    var rating = 0;

    stars.forEach(function (star) {
        star.addEventListener('mouseover', function () {
            stars.forEach(function (s, i) {
                s.classList.toggle('active', i < star.dataset.val);
            });
        });
        star.addEventListener('mouseleave', function () {
            stars.forEach(function (s, i) {
                s.classList.toggle('active', i < rating);
            });
        });
        star.addEventListener('click', function () {
            rating = parseInt(star.dataset.val);
            stars.forEach(function (s, i) {
                s.classList.toggle('active', i < rating);
            });
        });
    });

   
    if (window.matchMedia('(pointer:fine)').matches) {
        var glow = document.createElement('div');
        glow.style.cssText = 'position:fixed;pointer-events:none;z-index:9999;width:300px;height:300px;border-radius:50%;background:radial-gradient(circle,rgba(0,229,255,0.05) 0%,transparent 70%);transform:translate(-50%,-50%);transition:left 0.15s ease,top 0.15s ease;';
        document.body.appendChild(glow);
        document.addEventListener('mousemove', function (e) {
            glow.style.left = e.clientX + 'px';
            glow.style.top = e.clientY + 'px';
        });
    }

});