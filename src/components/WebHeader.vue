<style scoped>
.container {
    min-height: 50px;
    padding: 8px 0;
    position: fixed;
    width: 100%;
    z-index: 9999;
    box-shadow: 0 2px 5px rgba(0, 0, 0, .06);
}

.warp {
    margin: 0 auto;
    max-width: 1400px;
    padding: 0 16px;
}

.nav-warp {
    display: flex;
    flex-flow: row nowrap;
    position: relative;
    text-align: left;
}

.nav-warp a {
    text-decoration: none;
    align-items: center;
    border: 0;
    color: #000;
    display: flex;
    flex-flow: row nowrap;
    height: 34px;
    z-index: 10000;
}

.logo {
    border-style: none;
    box-sizing: content-box;
    max-width: 100%;
    height: 100%;
    margin-right: 10px;
}

.title {
    font-weight: bold;
}

.nav-list {
    height: 34px;
    margin-left: auto;
    position: relative;
}

.nav-list nav {
    background: none;
    height: auto;
    position: relative;
    right: auto;
    top: auto;
    width: auto;
}

.nav-list nav ul {
    background: none;
    display: flex;
    flex-flow: row nowrap;
    margin: 0;
    padding: 0;
    width: auto;
    list-style: none;
}

.nav-list nav ul li {
    flex: 1 1 auto;
    margin: 0;
    text-align: center;
    white-space: nowrap;
}

.nav-list nav ul li a {
    border: 0;
    color: #000;
    display: flex;
    font-size: 16px;
    font-size: 1em;
    height: 32px;
    line-height: 1.2em;
    margin: 0;
    padding: 6px 10px;
}

.nav-list nav ul li a:hover {
    color: rgb(76, 157, 189)
}
</style>

<template>
    <div class="container">
        <div class="warp">
            <div class="nav-warp">
                <a href="/" style="">
                    <img class="logo" :src="logo" />
                    <h2 class="title">Newbility</h2>
                </a>
                <div class="nav-list">
                    <nav>
                        <ul class="nav-site">
                            <li>
                                <RouterLink to="/docs">文档</RouterLink>
                            </li>
                            <li>
                                <RouterLink to="/about">关于</RouterLink>
                            </li>
                            <li>
                                <a href="https://www.npmjs.com/search?q=newbility" target="_blank">Npm</a>
                            </li>
                            <li>
                                <a href="https://github.com/Sunshine-JamesHu/newbility" target="_blank">GitHub</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { RouterLink } from 'vue-router'
import logo from '@/assets/logo.png'
</script>

