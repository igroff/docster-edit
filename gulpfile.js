var gulp   = require('gulp');
var concat = require('gulp-concat');
var coffee = require('gulp-coffee');
var gutil  = require('gulp-util');
var del    = require('del');
var debug  = require('gulp-debug');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('javascripts', function() {
  return gulp.src(['lib/ckeditor/ckeditor.js', 'src/vendor/*/*.js', 'src/*/*js'])
    .pipe(concat('js.js'))
    .pipe(gulp.dest('./site/'))
});

gulp.task('coffee', function(){
  return gulp.src(['src/*/*.coffee'])
    .pipe(coffee())
    .on('error', gutil.log)
    .pipe(concat('coffee.js'))
    .pipe(gulp.dest('./site/'))
});

gulp.task('all_scripts', ['coffee', 'javascripts'], function(cb){
  gulp.src(['./site/js.js', './site/coffee.js'])
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./site/'))
    .on('end', function(){
      del(['./site/coffee.js', './site/js.js'], cb);
    })
})

gulp.task('style', function(){
  gulp.src(['lib/ckeditor/contents.css', 'src/css/style.css'])
    .pipe(concat('all.css'))
    .pipe(gulp.dest('./site/'))
});

gulp.task('all', ['javascripts', 'coffee', 'all_scripts', 'style']);
gulp.task('default', ['all']);
gulp.task('watch',  ['all'], function(){
  gulp.watch('src/*/*.js', ['all']);
  gulp.watch('src/*/*.coffee', ['all']);
});
